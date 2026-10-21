Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) | Hub HMR  |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- | -------- |
| webpack 5.111.1         | 4140ms🥇           | 2810ms🥇             | 289ms   | 3069ms🥉         | 1070ms🥇        | 339ms🥇  |
| webpack 5.111.1 (Babel) | 6122ms🥉           | 2844ms🥈             | 288ms🥉 | 5049ms           | 1083ms🥈        | 339ms🥈  |
| Vite 8.3.0              | 5517ms🥈           | 3818ms🥉             | 11ms🥇  | 158ms🥈          | 5359ms🥉        | 1713ms   |
| Vite 7.3.7              | 6207ms             | 4316ms               | 12ms🥈  | 130ms🥇          | 6077ms          | 1710ms🥉 |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 3672ms🥉         | 1404ms🥉           | 866.4kB🥉   | 230.7kB      | 177.2kB     |
| webpack 5.111.1 (Babel) | 12318ms          | 1376ms🥈           | 872.5kB     | 229.1kB🥉    | 176.8kB🥉   |
| Vite 8.3.0              | 407ms🥇          | 407ms🥇            | 838.6kB🥈   | 226.2kB🥇    | 174.9kB🥇   |
| Vite 7.3.7              | 2419ms🥈         | 2420ms             | 827.6kB🥇   | 227.9kB🥈    | 176.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1081.0            | 935.8🥉             | 1164.6🥉        | 966.4🥉           |
| webpack 5.111.1 (Babel) | 1075.3🥉          | 977.0               | 1186.2          | 982.8             |
| Vite 8.3.0              | 662.3🥈           | 434.1🥈             | 663.5🥈         | 434.8🥇           |
| Vite 7.3.7              | 547.1🥇           | 429.0🥇             | 556.7🥇         | 437.6🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 858.4🥉         | 517.1🥉           |
| webpack 5.111.1 (Babel) | 1047.7          | 503.7🥈           |
| Vite 8.3.0              | 458.4🥇         | 463.7🥇           |
| Vite 7.3.7              | 584.7🥈         | 585.4             |

