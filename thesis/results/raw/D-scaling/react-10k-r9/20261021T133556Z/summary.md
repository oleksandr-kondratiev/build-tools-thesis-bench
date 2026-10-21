Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- |
| webpack 5.111.1         | 14217ms🥉          | 7666ms🥉             | 1778ms🥉 | 13028ms🥉        | 1185ms🥇        |
| webpack 5.111.1 (Babel) | 25576ms            | 7715ms               | 1815ms   | 24325ms          | 1241ms🥈        |
| Vite 8.3.0              | 6505ms🥇           | 4166ms🥇             | 11ms🥇   | 159ms🥈          | 6346ms🥉        |
| Vite 7.3.7              | 8021ms🥈           | 4728ms🥈             | 12ms🥈   | 131ms🥇          | 7889ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 16137ms🥉        | 5438ms🥈           | 5638.4kB🥉  | 1361.2kB🥈   | 1044.6kB    |
| webpack 5.111.1 (Babel) | 47078ms          | 5583ms🥉           | 5658.9kB    | 1343.4kB🥇   | 1040.6kB🥉  |
| Vite 8.3.0              | 1173ms🥇         | 1167ms🥇           | 5232.3kB🥈  | 1407.1kB     | 1000.2kB🥇  |
| Vite 7.3.7              | 10505ms🥈        | 10449ms            | 5147.2kB🥇  | 1402.4kB🥉   | 1001.5kB🥈  |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2605.4🥉          | 2604.4              | 2759.8          | 2642.3            |
| webpack 5.111.1 (Babel) | 2664.8            | 2596.2🥉            | 2758.7🥉        | 2618.8🥉          |
| Vite 8.3.0              | 1308.2🥈          | 457.1🥇             | 1317.3🥈        | 457.1🥇           |
| Vite 7.3.7              | 1011.3🥇          | 464.3🥈             | 1020.3🥇        | 477.0🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2232.9🥉        | 1527.6🥉          |
| webpack 5.111.1 (Babel) | 2527.0          | 1492.9🥈          |
| Vite 8.3.0              | 1378.6🥇        | 1379.2🥇          |
| Vite 7.3.7              | 1523.8🥈        | 1599.2            |

