# Analysis

Planned pipeline (raw → tidy → statistics → figures):

1. `aggregate.py` — reads `results/raw/**`, drops warm-up iterations, writes `data/measurements.csv`.
2. `stats.py` — medians, IQR, bootstrap 95 % intervals, Mann–Whitney U (pairs), Kruskal–Wallis
   (four configurations), effect sizes → `data/stats-*.csv`.
3. `complexity.py` — series D: log-log regression of T_hmr / T_ready / T_build on |V| → slopes with
   confidence intervals → `data/complexity.csv`.
4. `figures.py` — black-and-white figures for the thesis → `figures/*.svg`.

```bash
python3 -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt
```
