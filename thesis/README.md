# Bundle-based vs Native ESM: thesis benchmark data

> 🇺🇦 Експериментальні дані магістерської роботи «Порівняльний аналіз засобів збірки фронтенд-частини
> веб-застосунків» (Bundle-based — webpack + SWC/Babel, Native ESM — Vite 7/8). Сирі результати,
> скрипти стенда і протокол вимірювань відкриті для перевірки та повторення.

This directory contains everything needed to reproduce and audit the experimental part of a master's
thesis comparing the **Bundle-based** (webpack 5) and **Native ESM** (Vite) architectures of frontend
build tools: the cloud stand, the measurement protocol, raw per-iteration results and derived tables.

The benchmark itself is a fork of
[rstackjs/build-tools-performance](https://github.com/rstackjs/build-tools-performance), pinned at
commit [`11e66c0`](https://github.com/rstackjs/build-tools-performance/tree/11e66c03b8dbe415c4e71a79f7f8fb9a4b0e04b2)
(2026-10-09), extended with additional scenarios.

## What is measured

| Config | Bundler | Transpiler | Minifier |
| ------ | ------- | ---------- | -------- |
| **W5-B** | webpack 5.11x | Babel (`babel-loader`, `react-refresh/babel`) | Terser |
| **W5-S** | webpack 5.11x | SWC (`swc-loader`) — upstream default | SWC via `minimizer-webpack-plugin` |
| **V7** | Vite 7 (esbuild pre-bundling, Rollup build) | esbuild | esbuild |
| **V8** | Vite 8 (Rolldown) | Oxc | Oxc |

Metrics: dev-server readiness `T_ready` and page render `T_page`, HMR latency for a root component,
a leaf component and a non-component **hub module** imported by every component of a route,
production build time, process-tree peak/steady RSS, network requests when visiting **all** routes,
and artefact size (raw / gzip / brotli).

Extensions over the upstream benchmark:

1. 20 measured iterations (+2 warm-ups) instead of 3, on a single fixed VM instead of shared CI runners.
2. Hub-module HMR scenario (worst case `O(k)` propagation).
3. Visiting every lazy route, not just `/`.
4. A scaling series of `react-10k` with 1…9 connected routes for log-log regression of complexity.
5. Previous-generation configurations (W5-B, V7) next to the current ones (W5-S, V8).
6. A 2 GB memory stress scenario (OOM threshold, GC behaviour).

## Stand

| Item | Value |
| ---- | ----- |
| VM | see [`env/latest/vm.json`](env/latest) (target: Azure `Standard_F8as_v6`, 8 physical cores, SMT off) |
| OS | Ubuntu 24.04 LTS, cgroup v2, no swap |
| Container | `node:24-bookworm`, `--cpuset-cpus=2-5` (4 cores), `--memory=8g --memory-swap=8g` (stress: 2g) |
| Browser | Chrome for Testing via Puppeteer, `--no-sandbox --disable-dev-shm-usage` |

Isolation protocol: bundler caches are removed before each cold run (upstream script), tool order is
shuffled in every iteration, two warm-up iterations deliberately warm the OS page cache, and every
series runs in a fresh container. Results are summarised by medians with IQR and bootstrap intervals;
differences are tested with Mann–Whitney U and Kruskal–Wallis.

## Reproduce

```bash
# on a fresh Ubuntu 24.04 VM (see infra/)
sudo bash thesis/infra/vm-setup.sh && sudo reboot
docker build -f thesis/docker/Dockerfile --build-arg GIT_SHA="$(git rev-parse HEAD)" \
  -t thesis-bench:"$(git rev-parse --short HEAD)" -t thesis-bench:latest .
bash thesis/infra/collect-env.sh
tmux new -s bench
bash thesis/runner/run-queue.sh thesis/runner/plan-smoke.tsv
bash thesis/runner/run-queue.sh thesis/runner/plan-A.tsv
bash thesis/runner/run-queue.sh thesis/runner/plan-main.tsv
bash thesis/runner/run-queue.sh thesis/runner/plan-D.tsv
```

## Layout

```
thesis/
├── docker/        Dockerfile of the benchmark image
├── infra/         VM creation (Azure CLI), VM preparation, environment capture
├── runner/        run-series.sh (one series × case per container), run-queue.sh, plan-*.tsv,
│                  count-modules.sh (graph size |V| per case)
├── patches/       diff of benchmark sources against upstream 11e66c0
├── env/<vm>/      lscpu, kernel, Docker, Node, V8 heap limit, package versions
├── results/
│   ├── runs-index.csv                  one row per container run (status, OOM, git SHA, image)
│   ├── module-counts.jsonl             |V| and import count per case
│   └── raw/<series>/<case>/<run-id>/   untouched output of scripts/benchmark.ts + run metadata
├── data/          tidy CSV derived from raw/ by analysis/ (never edited by hand)
├── analysis/      statistics and figures (Python)
├── figures/       figures used in the thesis (SVG/PNG)
├── media/         screenshots and bundle treemaps
└── logs/          queue logs, GC traces, OOM evidence
```

See [`results/README.md`](results/README.md) for the file formats.

## Caveats

- Memory on Linux is **RSS** of the process tree; the upstream README reports macOS *physical
  footprint*. The two are not interchangeable — compare memory only within this dataset.
- Upstream "startup" is server readiness **plus** first render; this dataset records both separately.
- `os.cpus()` in `environment.json` reports all host CPUs; the effective CPU set is in
  `cgroup-cpuset.txt` of each run.
- Absolute timings depend on hardware. Ratios between tools and the shape of the scaling curves are
  the transferable results.

## License and citation

MIT — see [`LICENSE`](../LICENSE) (upstream copyright of farm-fe is retained). If you use the data,
please cite it via [`CITATION.cff`](../CITATION.cff).
