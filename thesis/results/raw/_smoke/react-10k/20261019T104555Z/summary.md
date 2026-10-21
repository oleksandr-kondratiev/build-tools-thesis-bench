Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- |
| webpack 5.111.1         | 16588ms🥉          | 7608ms🥉             | 1718ms🥉 | 13516ms🥉        | 3072ms🥈        |
| webpack 5.111.1 (Babel) | 25533ms            | 7899ms               | 1903ms   | 24302ms          | 1231ms🥇        |
| Vite 8.3.0              | 6308ms🥇           | 5215ms🥇             | 11ms🥇   | 166ms🥈          | 6142ms🥉        |
| Vite 7.3.7              | 8122ms🥈           | 5662ms🥈             | 13ms🥈   | 137ms🥇          | 7985ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 16638ms🥉        | 5498ms🥈           | 5638.3kB🥉  | 1361.1kB🥈   | 1044.0kB    |
| webpack 5.111.1 (Babel) | 48953ms          | 5679ms🥉           | 5658.9kB    | 1343.4kB🥇   | 1040.6kB🥉  |
| Vite 8.3.0              | 1202ms🥇         | 1186ms🥇           | 5232.3kB🥈  | 1407.1kB     | 1000.2kB🥇  |
| Vite 7.3.7              | 10728ms🥈        | 10833ms            | 5147.2kB🥇  | 1402.4kB🥉   | 1001.5kB🥈  |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2623.2            | 2515.7              | 2732.3🥉        | 2579.7🥉          |
| webpack 5.111.1 (Babel) | 2619.0🥉          | 2507.4🥉            | 2775.4          | 2595.1            |
| Vite 8.3.0              | 1296.7🥈          | 453.8🥈             | 1317.1🥈        | 453.8🥇           |
| Vite 7.3.7              | 1030.0🥇          | 447.1🥇             | 1030.0🥇        | 457.6🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2226.5🥉        | 1536.8            |
| webpack 5.111.1 (Babel) | 2504.8          | 1516.1🥉          |
| Vite 8.3.0              | 1376.4🥇        | 1394.1🥇          |
| Vite 7.3.7              | 1612.3🥈        | 1430.8🥈          |

