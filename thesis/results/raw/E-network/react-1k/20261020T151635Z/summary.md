Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) | Requests (all routes) | Transferred kB |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- | --------------------- | -------------- |
| webpack 5.111.1         | 4067ms🥇           | 2730ms🥇             | 283ms   | 3020ms🥉         | 1050ms🥇        | 8🥇                   | 612kB🥇        |
| webpack 5.111.1 (Babel) | 6015ms🥉           | 2791ms🥈             | 280ms🥉 | 4962ms           | 1052ms🥈        | 8🥈                   | 646kB🥈        |
| Vite 8.3.0              | 5263ms🥈           | 3799ms🥉             | 11ms🥇  | 160ms🥈          | 5103ms🥉        | 2513🥉                | 14203kB        |
| Vite 7.3.7              | 6017ms             | 4320ms               | 13ms🥈  | 133ms🥇          | 5884ms          | 2513                  | 11485kB🥉      |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 3583ms🥉         | 1355ms🥉           | 847.4kB🥉   | 230.3kB      | 177.2kB     |
| webpack 5.111.1 (Babel) | 12216ms          | 1340ms🥈           | 853.5kB     | 228.7kB🥉    | 176.8kB🥉   |
| Vite 8.3.0              | 401ms🥇          | 401ms🥇            | 825.6kB🥈   | 225.8kB🥇    | 173.9kB🥇   |
| Vite 7.3.7              | 2346ms🥈         | 2358ms             | 814.6kB🥇   | 227.3kB🥈    | 175.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 999.8             | 914.3🥉             | 1007.4🥉        | 929.0🥉           |
| webpack 5.111.1 (Babel) | 998.3🥉           | 925.8               | 1021.0          | 989.4             |
| Vite 8.3.0              | 641.2🥈           | 400.3🥇             | 641.2🥈         | 401.3🥇           |
| Vite 7.3.7              | 495.5🥇           | 402.7🥈             | 506.4🥇         | 411.4🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 842.7🥉         | 500.6🥉           |
| webpack 5.111.1 (Babel) | 1023.4          | 488.5🥈           |
| Vite 8.3.0              | 457.5🥇         | 459.7🥇           |
| Vite 7.3.7              | 580.6🥈         | 578.2             |

