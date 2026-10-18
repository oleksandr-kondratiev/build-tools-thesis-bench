#!/usr/bin/env bash
# Graph size |V| (and |E| approximation) for every case — needed for tables 3.3 and the series D regression.
#   bash thesis/runner/count-modules.sh react-1k react-5k react-10k react-10k-r{1..9} react-1k-hub
# Output: thesis/results/module-counts.jsonl (one JSON object per case). Not timed — run any time.
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel)"
IMAGE="${IMAGE:-thesis-bench:latest}"
OUT="$ROOT/thesis/results/module-counts.jsonl"
TMP="$(mktemp -d)"; chmod 777 "$TMP"; trap 'rm -rf "$TMP"' EXIT

for CASE in "$@"; do
  echo ">> $CASE"
  docker run --rm --cpuset-cpus="${CPUSET:-2-5}" --memory=8g --memory-swap=8g -v "$TMP:/out" "$IMAGE" sh -c "
    cd cases/$CASE &&
    NODE_ENV=development npx webpack build --mode development --json /out/stats.json >/dev/null &&
    node /bench/thesis/runner/count-modules.mjs /out/stats.json $CASE" | tee -a "$OUT"
  rm -f "$TMP/stats.json"
done
echo "appended to ${OUT#"$ROOT"/}"
