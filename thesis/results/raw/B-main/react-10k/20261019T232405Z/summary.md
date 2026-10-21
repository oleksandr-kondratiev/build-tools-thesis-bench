Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- |
| webpack 5.111.1         | 14275ms🥉          | 7719ms               | 1785ms🥉 | 13072ms🥉        | 1188ms🥇        |
| webpack 5.111.1 (Babel) | 25606ms            | 7710ms🥉             | 1838ms   | 24375ms          | 1233ms🥈        |
| Vite 8.3.0              | 6558ms🥇           | 4160ms🥇             | 11ms🥇   | 159ms🥈          | 6400ms🥉        |
| Vite 7.3.7              | 8123ms🥈           | 4713ms🥈             | 12ms🥈   | 133ms🥇          | 7991ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 16200ms🥉        | 5459ms🥈           | 5638.3kB🥉  | 1361.1kB🥈   | 1044.0kB    |
| webpack 5.111.1 (Babel) | 46832ms          | 5590ms🥉           | 5658.9kB    | 1343.4kB🥇   | 1040.6kB🥉  |
| Vite 8.3.0              | 1173ms🥇         | 1171ms🥇           | 5232.3kB🥈  | 1407.1kB     | 1000.2kB🥇  |
| Vite 7.3.7              | 10554ms🥈        | 10535ms            | 5147.2kB🥇  | 1402.4kB🥉   | 1001.5kB🥈  |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2250.8🥉          | 2641.2              | 2741.1🥉        | 2697.1            |
| webpack 5.111.1 (Babel) | 2644.2            | 2520.7🥉            | 2770.2          | 2606.1🥉          |
| Vite 8.3.0              | 1293.9🥈          | 445.6🥇             | 1304.4🥈        | 445.6🥇           |
| Vite 7.3.7              | 1007.7🥇          | 473.7🥈             | 1007.7🥇        | 482.7🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2221.8🥉        | 1521.9🥉          |
| webpack 5.111.1 (Babel) | 2611.9          | 1501.3🥈          |
| Vite 8.3.0              | 1386.1🥇        | 1385.5🥇          |
| Vite 7.3.7              | 1575.9🥈        | 1606.4            |

