# Patches against upstream

Everything changed outside `thesis/` relative to upstream commit `11e66c0`, as one reviewable diff
(also goes into the thesis appendix):

```bash
git diff 11e66c0 -- scripts shared cases package.json pnpm-lock.yaml ':!cases/*-hub' ':!cases/react-10k-r*' \
  > thesis/patches/benchmark.diff
git diff --stat 11e66c0 -- scripts shared cases package.json > thesis/patches/benchmark.diffstat.txt
```

Generated cases (`react-*-hub`, `react-10k-r1…r9`) are excluded from the diff — they are reproduced
by the case-generation script, which should live in `thesis/patches/` or `scripts/`.
