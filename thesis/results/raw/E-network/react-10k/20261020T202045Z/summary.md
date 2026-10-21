Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Recovered after retry

1 failed attempt(s); failed attempts are excluded from metrics.

- Vite 8.3.0, timing, dev, iteration 15: Error: all routes timed out after 60000ms

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) | Requests (all routes) | Transferred kB |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- | --------------------- | -------------- |
| webpack 5.111.1         | 14290ms🥉          | 7660ms               | 1749ms🥉 | 13097ms🥉        | 1180ms🥇        | 19🥇                  | 2281kB🥇       |
| webpack 5.111.1 (Babel) | 25548ms            | 7655ms🥉             | 1843ms   | 24316ms          | 1225ms🥈        | 19🥈                  | 2416kB🥈       |
| Vite 8.3.0              | 6849ms🥇           | 4268ms🥇             | 12ms🥇   | 158ms🥈          | 6692ms🥉        | 20011🥉               | 77060kB🥉      |
| Vite 7.3.7              | 8306ms🥈           | 4785ms🥈             | 13ms🥈   | 132ms🥇          | 8171ms          | 20011                 | 77218kB        |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 16227ms🥉        | 5450ms🥈           | 5638.3kB🥉  | 1361.1kB🥈   | 1044.0kB    |
| webpack 5.111.1 (Babel) | 46898ms          | 5591ms🥉           | 5658.9kB    | 1343.4kB🥇   | 1040.6kB🥉  |
| Vite 8.3.0              | 1164ms🥇         | 1172ms🥇           | 5232.3kB🥈  | 1407.1kB     | 1000.2kB🥇  |
| Vite 7.3.7              | 10517ms🥈        | 10497ms            | 5147.2kB🥇  | 1402.4kB🥉   | 1001.5kB🥈  |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2645.2🥉          | 2625.2              | 2734.2🥉        | 2686.7            |
| webpack 5.111.1 (Babel) | 2662.2            | 2546.6🥉            | 2769.6          | 2617.1🥉          |
| Vite 8.3.0              | 1307.8🥈          | 445.6🥇             | 1316.1🥈        | 445.6🥇           |
| Vite 7.3.7              | 1013.5🥇          | 473.5🥈             | 1013.5🥇        | 481.6🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2226.4🥉        | 1526.2🥉          |
| webpack 5.111.1 (Babel) | 2530.7          | 1488.9🥈          |
| Vite 8.3.0              | 1387.2🥇        | 1384.7🥇          |
| Vite 7.3.7              | 1602.2🥈        | 1602.5            |

