#!/usr/bin/env bash
# Runs a plan file line by line (unattended). Start it inside tmux so an SSH drop does not kill it:
#   tmux new -s bench
#   bash thesis/runner/run-queue.sh thesis/runner/plan-A.tsv
#   (detach: Ctrl-b d; re-attach: tmux attach -t bench)
#
# Plan format: one run per line, whitespace-separated:  SERIES  CASE  [RUN_TIMES]  [WARMUP_TIMES]
# Lines starting with # are skipped. A failed run is logged and the queue continues.
set -uo pipefail
PLAN="${1:?usage: run-queue.sh <plan.tsv>}"
ROOT="$(git rev-parse --show-toplevel)"
LOG="$ROOT/thesis/logs/queue/$(basename "$PLAN" .tsv)-$(date -u +%Y%m%dT%H%M%SZ).log"
mkdir -p "$(dirname "$LOG")"

mapfile -t LINES < <(grep -vE '^\s*(#|$)' "$PLAN")
TOTAL=${#LINES[@]}; N=0; FAILED=0
echo "queue $PLAN: $TOTAL runs, log: $LOG" | tee -a "$LOG"

for line in "${LINES[@]}"; do
  N=$((N + 1))
  read -r SERIES CASE RUNS WARM <<<"$line"
  echo "[$(date -u +%FT%TZ)] ($N/$TOTAL) START $SERIES $CASE ${RUNS:-} ${WARM:-}" | tee -a "$LOG"
  bash "$ROOT/thesis/runner/run-series.sh" "$SERIES" "$CASE" ${RUNS:+"$RUNS"} ${WARM:+"$WARM"} >> "$LOG" 2>&1
  RC=$?
  (( RC == 0 )) || FAILED=$((FAILED + 1))
  echo "[$(date -u +%FT%TZ)] ($N/$TOTAL) END   $SERIES $CASE exit=$RC" | tee -a "$LOG"
  sleep 30   # cool-down between containers
done
echo "queue done: $((TOTAL - FAILED))/$TOTAL succeeded" | tee -a "$LOG"
