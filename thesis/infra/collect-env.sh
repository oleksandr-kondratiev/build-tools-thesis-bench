#!/usr/bin/env bash
# Records the hardware/software environment of the stand (table 3.4 of the thesis).
# Run on the VM from the repository root AFTER the image is built:
#   bash thesis/infra/collect-env.sh            # label defaults to <vmSize>-<date>
# Output: thesis/env/<label>/ + symlink thesis/env/latest
# Everything written here is meant to be PUBLIC: no hostnames, IPs, subscription IDs or usernames.
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel)"
IMAGE="${IMAGE:-thesis-bench:latest}"

# Azure Instance Metadata Service — keep only non-identifying fields.
IMDS="$(curl -fsS -m 3 -H Metadata:true --noproxy '*' \
  'http://169.254.169.254/metadata/instance/compute?api-version=2021-02-01' 2>/dev/null || echo '{}')"
VM_SIZE="$(jq -r '.vmSize // "unknown-vm"' <<<"$IMDS")"
LABEL="${LABEL:-${VM_SIZE}-$(date -u +%Y%m%d)}"
OUT="$ROOT/thesis/env/$LABEL"
mkdir -p "$OUT"

jq '{provider: (if .vmSize then "azure" else "unknown" end), vmSize, location, zone,
     image: .storageProfile.imageReference | {publisher, offer, sku, version},
     osDisk: {sizeGB: .storageProfile.osDisk.diskSizeGB,
              type: .storageProfile.osDisk.managedDisk.storageAccountType}}' \
  <<<"$IMDS" > "$OUT/vm.json"

# Host
uname -srvmo                 > "$OUT/uname.txt"      # -n (hostname) deliberately omitted
cp /etc/os-release             "$OUT/os-release.txt"
lscpu                        > "$OUT/lscpu.txt"
lscpu -e=CPU,CORE,SOCKET,NODE,ONLINE,MAXMHZ > "$OUT/lscpu-e.txt"
nproc                        > "$OUT/nproc.txt"
free -m                      > "$OUT/free-m.txt"
df -h / | sed 's#/dev/[^ ]*#<disk>#' > "$OUT/df.txt"
sysctl fs.inotify.max_user_watches fs.inotify.max_user_instances > "$OUT/sysctl.txt"
swapon --show                > "$OUT/swap.txt" || true
cat /proc/cmdline | sed 's/root=[^ ]*/root=<redacted>/' > "$OUT/kernel-cmdline.txt"
docker version --format '{{json .}}' | jq '{client: .Client.Version, server: .Server.Version}' > "$OUT/docker-version.json"
docker info --format '{{json .}}' | jq '{ServerVersion, Driver, CgroupDriver, CgroupVersion,
  KernelVersion, OperatingSystem, Architecture, NCPU, MemTotal, SecurityOptions}' > "$OUT/docker-info.json"

# Image / container
docker image inspect "$IMAGE" --format '{{json .}}' \
  | jq '{id: .Id, repoTags: .RepoTags, created: .Created, revision: .Config.Labels["org.opencontainers.image.revision"]}' \
  > "$OUT/image.json"
docker run --rm "$IMAGE" sh -c 'echo "node $(node -v)"; echo "pnpm $(pnpm -v)"; $PUPPETEER_EXECUTABLE_PATH --version' \
  > "$OUT/runtime-versions.txt"
docker run --rm "$IMAGE" pnpm ls --depth 0 --json > "$OUT/pnpm-ls-root.json"

# V8 heap limit inside the container — fills the placeholders in section 1.2.4 of the thesis.
for MEM in 8g 2g; do
  printf '%s\t' "$MEM" >> "$OUT/v8-heap-limit.tsv"
  docker run --rm --memory="$MEM" --memory-swap="$MEM" "$IMAGE" \
    node -p 'Math.round(v8.getHeapStatistics().heap_size_limit / 2**20) + " MiB"' >> "$OUT/v8-heap-limit.tsv"
done

ln -sfn "$LABEL" "$ROOT/thesis/env/latest"
echo "Environment recorded in thesis/env/$LABEL"
cat "$OUT/v8-heap-limit.tsv"
