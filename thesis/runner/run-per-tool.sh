#!/usr/bin/env bash
# Runs one series × case once per tool, each in its own container, so a tool that crashes
# (e.g. OOM under the 2 GB limit of series F) does not discard the other tools' results.
#   bash thesis/runner/run-per-tool.sh F react-10k
set -uo pipefail
ROOT="$(git rev-parse --show-toplevel)"
SERIES="${1:?series}"; CASE="${2:?case}"; shift 2
RC=0
for TOOL in webpack webpack-babel vite vite7; do
  echo "[$(date -u +%FT%TZ)] START $SERIES $CASE $TOOL"
  TOOLS="$TOOL" NOTE="per-tool" bash "$ROOT/thesis/runner/run-series.sh" "$SERIES" "$CASE" "$@" || RC=1
  echo "[$(date -u +%FT%TZ)] END   $SERIES $CASE $TOOL"
  sleep 30
done
exit $RC
