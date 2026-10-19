#!/usr/bin/env bash
# Runs ONE benchmark invocation (one series × one case) in its own fresh container.
#
#   bash thesis/runner/run-series.sh <SERIES> <CASE> [RUN_TIMES] [WARMUP_TIMES]
#   e.g. bash thesis/runner/run-series.sh A react-1k
#
# Series (see thesis plan, stage 3):
#   A  replication       W5-S, V8            8 GB   20 runs   unmodified cases
#   B  main matrix       W5-B, W5-S, V7, V8  8 GB   20 runs
#   C  hub module        all four            8 GB   20 runs   cases react-*-hub
#   D  scaling           all four            8 GB   10 runs   cases react-10k-r1 … r9
#   E  network waterfall all four            8 GB   20 runs   needs ALL_ROUTES support in the patch
#   F  stress 2 GB       all four            2 GB    5 runs   react-5k, react-10k
#   Fgc  GC diagnostics  all four            2 GB    3 runs   --trace-gc; NOT used for timings
#   G  artefact quality  all four            8 GB    5 runs   popular-libs
#
# Overrides via environment: IMAGE, CPUSET, MEM, TOOLS, EXTRA_ENV ("K=V K2=V2"), NOTE.
set -euo pipefail

SERIES="${1:?usage: run-series.sh <SERIES> <CASE> [RUN_TIMES] [WARMUP_TIMES]}"
CASE="${2:?case name required, e.g. react-1k}"
ROOT="$(git rev-parse --show-toplevel)"
IMAGE="${IMAGE:-thesis-bench:latest}"
CPUSET="${CPUSET:-2-5}"          # 4 physical cores; check `lscpu -e` (distinct CORE values!)
ALL4="webpack,webpack-babel,vite,vite7"   # tool ids as registered in your patched benchmark.ts

case "$SERIES" in
  A)   DIR=A-replication;  DEF_TOOLS="webpack,vite"; DEF_MEM=8g; DEF_RUNS=20; DEF_WARM=2; DEF_EXTRA="" ;;
  B)   DIR=B-main;         DEF_TOOLS="$ALL4";        DEF_MEM=8g; DEF_RUNS=20; DEF_WARM=2; DEF_EXTRA="" ;;
  C)   DIR=C-hub;          DEF_TOOLS="$ALL4";        DEF_MEM=8g; DEF_RUNS=20; DEF_WARM=2; DEF_EXTRA="" ;;
  D)   DIR=D-scaling;      DEF_TOOLS="$ALL4";        DEF_MEM=8g; DEF_RUNS=10; DEF_WARM=2; DEF_EXTRA="" ;;
  E)   DIR=E-network;      DEF_TOOLS="$ALL4";        DEF_MEM=8g; DEF_RUNS=20; DEF_WARM=2; DEF_EXTRA="ALL_ROUTES=1" ;;
  F)   DIR=F-stress-2g;    DEF_TOOLS="$ALL4";        DEF_MEM=2g; DEF_RUNS=5;  DEF_WARM=1; DEF_EXTRA="" ;;
  Fgc) DIR=F-gc-trace;     DEF_TOOLS="$ALL4";        DEF_MEM=2g; DEF_RUNS=3;  DEF_WARM=0; DEF_EXTRA="NODE_OPTIONS=--trace-gc DEBUG=1" ;;
  G)   DIR=G-artifacts;    DEF_TOOLS="$ALL4";        DEF_MEM=8g; DEF_RUNS=5;  DEF_WARM=1; DEF_EXTRA="" ;;
  SMOKE) DIR=_smoke;       DEF_TOOLS="$ALL4";        DEF_MEM=8g; DEF_RUNS=1;  DEF_WARM=0; DEF_EXTRA="" ;;
  *) echo "unknown series '$SERIES' (A B C D E F Fgc G SMOKE)"; exit 2 ;;
esac

TOOLS="${TOOLS:-$DEF_TOOLS}"
MEM="${MEM:-$DEF_MEM}"
RUN_TIMES="${3:-$DEF_RUNS}"
WARMUP_TIMES="${4:-$DEF_WARM}"
EXTRA_ENV="${EXTRA_ENV:-$DEF_EXTRA}"
NOTE="${NOTE:-}"

RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
OUT="$ROOT/thesis/results/raw/$DIR/$CASE/$RUN_ID"
INDEX="$ROOT/thesis/results/runs-index.csv"
NAME="bench-${SERIES}-${CASE}-${RUN_ID}"
mkdir -p "$OUT"

# ---------- pre-flight: the machine must be quiet ----------
if [[ -n "$(docker ps -q)" ]]; then echo "!! other containers are running — aborting"; docker ps; exit 3; fi
for _ in $(seq 1 30); do
  LOAD1="$(cut -d' ' -f1 /proc/loadavg)"
  awk "BEGIN{exit !($LOAD1 < 0.5)}" && break
  echo "   waiting for load average to drop (now $LOAD1)…"; sleep 10
done
FREE_GB="$(df -BG --output=avail "$ROOT" | tail -1 | tr -dc 0-9)"
(( FREE_GB > 15 )) || { echo "!! less than 15 GB free on disk"; exit 4; }
IMG_REV="$(docker image inspect "$IMAGE" --format '{{index .Config.Labels "org.opencontainers.image.revision"}}')"
# Commits that only add results are fine; any change to benchmark sources since the build is not.
SRC_PATHS=(scripts shared cases tools package.json pnpm-lock.yaml pnpm-workspace.yaml thesis/docker thesis/patches)
if ! git -C "$ROOT" diff --quiet "$IMG_REV" HEAD -- "${SRC_PATHS[@]}" 2>/dev/null; then
  echo "!! benchmark sources changed since the image was built from ${IMG_REV:-?} — rebuild the image"
  [[ "${ALLOW_STALE_IMAGE:-0}" == "1" ]] || exit 5
fi
[[ "$(id -u)" == "1000" ]] || echo "!! host uid is $(id -u), container user is 1000 — results dir may not be writable"

ENV_ARGS=(-e "CASE=$CASE" -e "TOOLS=$TOOLS" -e "RUN_TIMES=$RUN_TIMES" -e "WARMUP_TIMES=$WARMUP_TIMES" -e "RESULTS_DIR=/results")
for kv in $EXTRA_ENV; do ENV_ARGS+=(-e "$kv"); done

STARTED="$(date -u +%FT%TZ)"; T0=$SECONDS
echo ">> $NAME  tools=$TOOLS runs=$RUN_TIMES warmup=$WARMUP_TIMES mem=$MEM cpuset=$CPUSET extra='$EXTRA_ENV'"

set +e
docker run --name "$NAME" \
  --cpuset-cpus="$CPUSET" --memory="$MEM" --memory-swap="$MEM" \
  "${ENV_ARGS[@]}" -v "$OUT:/results" "$IMAGE" \
  bash -c 'pnpm benchmark; rc=$?
           cp /sys/fs/cgroup/memory.events /results/cgroup-memory.events 2>/dev/null
           cp /sys/fs/cgroup/memory.peak   /results/cgroup-memory.peak   2>/dev/null
           cp /sys/fs/cgroup/cpu.max       /results/cgroup-cpu.max       2>/dev/null
           cp /sys/fs/cgroup/cpuset.cpus.effective /results/cgroup-cpuset.txt 2>/dev/null
           exit $rc' 2>&1 | tee "$OUT/console.log"
RC=${PIPESTATUS[0]}
set -e

STATE="$(docker inspect "$NAME" --format '{{json .State}}' 2>/dev/null || echo '{}')"
IMAGE_ID="$(docker image inspect "$IMAGE" --format '{{.Id}}')"
GIT_SHA="$IMG_REV"                       # code baked into the image
REPO_HEAD="$(git -C "$ROOT" rev-parse HEAD)"
GIT_DIRTY="$(git -C "$ROOT" status --porcelain -- "${SRC_PATHS[@]}" | wc -l)"
docker rm "$NAME" >/dev/null 2>&1 || true
FINISHED="$(date -u +%FT%TZ)"; DURATION=$((SECONDS - T0))
OOM="$(jq -r '.OOMKilled // false' <<<"$STATE")"
OOM_KILLS="$(awk '/^oom_kill /{print $2}' "$OUT/cgroup-memory.events" 2>/dev/null || echo NA)"
VM_SIZE="$(jq -r '.vmSize // "unknown"' "$ROOT/thesis/env/latest/vm.json" 2>/dev/null || echo unknown)"

jq -n --arg series "$SERIES" --arg dir "$DIR" --arg case "$CASE" --arg run_id "$RUN_ID" \
  --arg tools "$TOOLS" --argjson run_times "$RUN_TIMES" --argjson warmup_times "$WARMUP_TIMES" \
  --arg mem "$MEM" --arg cpuset "$CPUSET" --arg extra_env "$EXTRA_ENV" \
  --arg image "$IMAGE" --arg image_id "$IMAGE_ID" --arg git_sha "$GIT_SHA" --arg repo_head "$REPO_HEAD" --argjson git_dirty_files "$GIT_DIRTY" \
  --arg vm_size "$VM_SIZE" --arg started "$STARTED" --arg finished "$FINISHED" --argjson duration_s "$DURATION" \
  --argjson exit_code "$RC" --argjson container_state "$STATE" --arg cgroup_oom_kills "$OOM_KILLS" --arg note "$NOTE" \
  '$ARGS.named' > "$OUT/run-meta.json"

[[ -f "$INDEX" ]] || echo "run_id,series,case,tools,run_times,warmup_times,mem,cpuset,exit_code,oom_killed,cgroup_oom_kills,started_utc,finished_utc,duration_s,git_sha,image_id,vm_size,path,note" > "$INDEX"
echo "$RUN_ID,$SERIES,$CASE,\"$TOOLS\",$RUN_TIMES,$WARMUP_TIMES,$MEM,$CPUSET,$RC,$OOM,$OOM_KILLS,$STARTED,$FINISHED,$DURATION,$GIT_SHA,$IMAGE_ID,$VM_SIZE,raw/$DIR/$CASE/$RUN_ID,\"$NOTE\"" >> "$INDEX"

echo ">> finished: exit=$RC oom_killed=$OOM cgroup_oom_kills=$OOM_KILLS duration=${DURATION}s -> ${OUT#"$ROOT"/}"
(( GIT_DIRTY == 0 )) || echo "!! benchmark sources have uncommitted changes — commit them so git_sha identifies the code"
exit "$RC"
