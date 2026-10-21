Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) | Hub HMR  |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- | -------- |
| webpack 5.111.1         | 4217ms🥇           | 2863ms🥇             | 307ms   | 3156ms🥉         | 1061ms🥇        | 347ms🥇  |
| webpack 5.111.1 (Babel) | 6359ms             | 2884ms🥈             | 298ms🥉 | 5238ms           | 1121ms🥈        | 356ms🥈  |
| Vite 8.3.0              | 6104ms🥉           | 5303ms🥉             | 12ms🥇  | 168ms🥈          | 5936ms          | 2102ms   |
| Vite 7.3.7              | 5929ms🥈           | 5535ms               | 13ms🥈  | 135ms🥇          | 5794ms🥉        | 1534ms🥉 |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 3860ms🥉         | 1442ms🥉           | 866.4kB🥉   | 230.7kB      | 177.2kB     |
| webpack 5.111.1 (Babel) | 13016ms          | 1394ms🥈           | 872.5kB     | 229.1kB🥉    | 176.8kB🥉   |
| Vite 8.3.0              | 415ms🥇          | 423ms🥇            | 838.6kB🥈   | 226.2kB🥇    | 174.9kB🥇   |
| Vite 7.3.7              | 2484ms🥈         | 2500ms             | 827.6kB🥇   | 227.9kB🥈    | 176.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1088.8🥉          | 933.4🥉             | 1193.7🥉        | 965.8🥉           |
| webpack 5.111.1 (Babel) | 1118.9            | 952.9               | 1246.5          | 983.7             |
| Vite 8.3.0              | 664.3🥈           | 434.4🥈             | 666.0🥈         | 436.9🥇           |
| Vite 7.3.7              | 529.4🥇           | 427.0🥇             | 533.3🥇         | 437.5🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 853.0🥉         | 476.0🥈           |
| webpack 5.111.1 (Babel) | 1026.0          | 504.8🥉           |
| Vite 8.3.0              | 456.6🥇         | 474.9🥇           |
| Vite 7.3.7              | 587.3🥈         | 594.8             |

