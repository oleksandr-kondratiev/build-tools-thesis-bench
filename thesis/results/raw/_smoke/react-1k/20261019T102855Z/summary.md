Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 4035ms🥇           | 2682ms🥇             | 284ms   | 2980ms🥉         | 1055ms🥈        |
| webpack 5.111.1 (Babel) | 6019ms🥉           | 2742ms🥈             | 281ms🥉 | 4990ms           | 1029ms🥇        |
| Vite 8.3.0              | 5132ms🥈           | 5046ms🥉             | 11ms🥇  | 163ms🥈          | 4969ms🥉        |
| Vite 7.3.7              | 6044ms             | 5580ms               | 12ms🥈  | 132ms🥇          | 5912ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 3520ms🥉         | 1353ms🥉           | 847.4kB🥉   | 230.3kB      | 177.2kB     |
| webpack 5.111.1 (Babel) | 12104ms          | 1330ms🥈           | 853.5kB     | 228.7kB🥉    | 176.8kB🥉   |
| Vite 8.3.0              | 397ms🥇          | 405ms🥇            | 825.6kB🥈   | 225.8kB🥇    | 173.9kB🥇   |
| Vite 7.3.7              | 2378ms🥈         | 2356ms             | 814.6kB🥇   | 227.3kB🥈    | 175.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1014.7            | 879.5🥉             | 1026.0          | 922.9🥉           |
| webpack 5.111.1 (Babel) | 993.2🥉           | 937.8               | 1001.9🥉        | 953.3             |
| Vite 8.3.0              | 618.1🥈           | 400.5🥇             | 618.1🥈         | 400.5🥇           |
| Vite 7.3.7              | 482.9🥇           | 430.9🥈             | 483.8🥇         | 434.5🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 835.4🥉         | 495.1🥉           |
| webpack 5.111.1 (Babel) | 994.2           | 489.3🥈           |
| Vite 8.3.0              | 457.8🥇         | 460.0🥇           |
| Vite 7.3.7              | 581.7🥈         | 578.3             |

