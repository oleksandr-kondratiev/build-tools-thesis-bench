#!/usr/bin/env bash
# Stop paying for compute between sessions, or delete everything at the end.
#   ./teardown.sh stop     -> deallocate (compute billing stops, disk is kept, ~cents/day)
#   ./teardown.sh start    -> start again (public IP of Standard SKU is static, stays the same)
#   ./teardown.sh delete   -> delete the whole resource group (VM, disk, IP, NSG). Irreversible.
set -euo pipefail
RG="${RG:-thesis-bench-rg}"
VM="${VM:-bench-vm}"

case "${1:-}" in
  stop)   az vm deallocate -g "$RG" -n "$VM" ;;
  start)  az vm start -g "$RG" -n "$VM"; az vm show -d -g "$RG" -n "$VM" --query publicIps -o tsv ;;
  delete)
    echo "This deletes resource group '$RG' and EVERYTHING in it. Make sure results are pushed to GitHub."
    read -r -p "Type the resource group name to confirm: " c
    [[ "$c" == "$RG" ]] && az group delete -n "$RG" --yes --no-wait && echo "Deletion started." ;;
  *) echo "usage: $0 stop|start|delete"; exit 1 ;;
esac
