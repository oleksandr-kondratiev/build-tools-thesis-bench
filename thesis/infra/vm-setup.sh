#!/usr/bin/env bash
# One-time preparation of a fresh Ubuntu 24.04 LTS VM for benchmarking.
# Run on the VM:  sudo bash thesis/infra/vm-setup.sh
# Idempotent: safe to run again. Reboot afterwards.
set -euo pipefail
[[ $EUID -eq 0 ]] || { echo "run with sudo"; exit 1; }
BENCH_USER="${SUDO_USER:-bench}"

echo ">> 1/6 Base packages"
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y
apt-get install -y --no-install-recommends \
  ca-certificates curl git jq tmux htop sysstat zstd zip unzip rsync python3-venv

echo ">> 2/6 Docker Engine (official repository)"
if ! command -v docker >/dev/null; then
  install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  chmod a+r /etc/apt/keyrings/docker.asc
  # shellcheck disable=SC1091
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" \
    > /etc/apt/sources.list.d/docker.list
  apt-get update -y
  apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin
fi
usermod -aG docker "$BENCH_USER"
mkdir -p /etc/docker
cat > /etc/docker/daemon.json <<'JSON'
{
  "log-driver": "json-file",
  "log-opts": { "max-size": "50m", "max-file": "3" }
}
JSON
systemctl restart docker

echo ">> 3/6 Remove background noise during measurements"
# Automatic updates / snap refreshes can start mid-series and steal CPU and disk I/O.
systemctl disable --now unattended-upgrades.service 2>/dev/null || true
systemctl disable --now apt-daily.timer apt-daily-upgrade.timer 2>/dev/null || true
systemctl disable --now motd-news.timer 2>/dev/null || true
snap set system refresh.hold="$(date -u -d '+60 days' +%Y-%m-%dT%H:%M:%SZ)" 2>/dev/null || true
# Keep: walinuxagent (Azure agent), chrony (time sync), ssh.

echo ">> 4/6 No swap (methodology: memory limits must be hard limits)"
swapoff -a || true
sed -i.bak '/\sswap\s/ s/^/#/' /etc/fstab || true

echo ">> 5/6 Kernel limits for file watchers (10k+ files watched by webpack/Vite)"
cat > /etc/sysctl.d/90-bench.conf <<'CONF'
fs.inotify.max_user_watches = 1048576
fs.inotify.max_user_instances = 1024
fs.file-max = 2097152
CONF
sysctl --system >/dev/null

echo ">> 6/6 Sanity checks"
echo "cgroup fs: $(stat -fc %T /sys/fs/cgroup)   (expected: cgroup2fs)"
echo "swap:      $(swapon --show | wc -l) active devices (expected: 0)"
echo "cpus:      $(nproc)   threads per core: $(lscpu | awk -F: '/Thread\(s\) per core/ {gsub(/ /,"",$2); print $2}')"
docker --version
echo
echo "Done. Log out and back in (docker group), or simply: sudo reboot"
