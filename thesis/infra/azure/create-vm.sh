#!/usr/bin/env bash
# Creates the benchmark VM in Azure (run on your laptop with Azure CLI logged in: `az login`).
#
# Why Standard_F8as_v6: compute-optimised, NOT burstable, AMD EPYC 9004 (Genoa) with SMT disabled,
# so each of the 8 vCPUs is a full physical core. The container gets 4 of them (cpuset), the rest
# stay free for the OS, dockerd and the Azure agent.
# Fallbacks (in order): Standard_F8s_v2 (SMT on: pick 4 vCPUs on different cores, see guide),
# Standard_D8as_v6. Never use B-series (burstable CPU credits distort timings).
set -euo pipefail

RG="${RG:-thesis-bench-rg}"
LOCATION="${LOCATION:-polandcentral}"      # must be in your subscription's "Allowed regions" policy
VM="${VM:-bench-vm}"
SIZE="${SIZE:-Standard_F8as_v6}"
ADMIN="${ADMIN:-bench}"                     # uid 1000 on the VM == uid of `node` user in the container
DISK_GB="${DISK_GB:-128}"                   # Premium SSD P10: 500 IOPS / 100 MB/s + bursting
IMAGE="${IMAGE:-Canonical:ubuntu-24_04-lts:server:latest}"
SHUTDOWN_UTC="${SHUTDOWN_UTC:-}"            # e.g. 2100 = auto-shutdown at 21:00 UTC; empty = off

echo ">> Checking that $SIZE is offered to this subscription in $LOCATION"
az vm list-skus --location "$LOCATION" --size "${SIZE}" --resource-type virtualMachines \
  --query "[].{name:name, restrictions:restrictions[].reasonCode}" -o table
echo ">> vCPU quota (look at 'Total Regional vCPUs' and the family row)"
az vm list-usage --location "$LOCATION" -o table | grep -Ei "Total Regional vCPUs|FAS|FSv2|DASv6" || true
read -r -p "Continue creating the VM? [y/N] " ok; [[ "$ok" == "y" ]] || exit 1

az group create --name "$RG" --location "$LOCATION" -o none

# No --zone on purpose ("no infrastructure redundancy"): zonal requests fail more often on student subscriptions.
# If Azure rejects the disk controller for this size, add:  --disk-controller-type NVMe
az vm create \
  --resource-group "$RG" --name "$VM" \
  --image "$IMAGE" --size "$SIZE" \
  --admin-username "$ADMIN" --generate-ssh-keys \
  --os-disk-size-gb "$DISK_GB" --storage-sku Premium_LRS \
  --public-ip-sku Standard

# Allow SSH only from your current public IP.
MYIP="$(curl -fsS https://api.ipify.org)"
az network nsg rule update --resource-group "$RG" --nsg-name "${VM}NSG" \
  --name default-allow-ssh --source-address-prefixes "${MYIP}/32" -o none
echo ">> SSH restricted to ${MYIP}/32"

if [[ -n "$SHUTDOWN_UTC" ]]; then
  az vm auto-shutdown --resource-group "$RG" --name "$VM" --time "$SHUTDOWN_UTC" -o none
  echo ">> Auto-shutdown at ${SHUTDOWN_UTC} UTC (disable it while a long queue is running!)"
fi

IP="$(az vm show -d -g "$RG" -n "$VM" --query publicIps -o tsv)"
echo
echo "Done. Connect with:  ssh ${ADMIN}@${IP}"
echo "Next: copy thesis/infra/vm-setup.sh to the VM and run it with sudo."
