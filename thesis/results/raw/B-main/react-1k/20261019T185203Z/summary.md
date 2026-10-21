Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 4062ms🥇           | 2729ms🥇             | 282ms   | 3014ms🥉         | 1054ms🥇        |
| webpack 5.111.1 (Babel) | 6010ms             | 2766ms🥈             | 279ms🥉 | 4919ms           | 1089ms🥈        |
| Vite 8.3.0              | 5165ms🥈           | 3698ms🥉             | 11ms🥇  | 160ms🥈          | 5007ms🥉        |
| Vite 7.3.7              | 5940ms🥉           | 4231ms               | 12ms🥈  | 132ms🥇          | 5809ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 3569ms🥉         | 1359ms🥉           | 847.4kB🥉   | 230.3kB      | 177.2kB     |
| webpack 5.111.1 (Babel) | 12182ms          | 1335ms🥈           | 853.5kB     | 228.7kB🥉    | 176.8kB🥉   |
| Vite 8.3.0              | 398ms🥇          | 400ms🥇            | 825.6kB🥈   | 225.8kB🥇    | 173.9kB🥇   |
| Vite 7.3.7              | 2359ms🥈         | 2353ms             | 814.6kB🥇   | 227.3kB🥈    | 175.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 997.3🥉           | 920.2🥉             | 1008.4🥉        | 928.6🥉           |
| webpack 5.111.1 (Babel) | 1005.2            | 928.5               | 1025.4          | 962.4             |
| Vite 8.3.0              | 644.1🥈           | 400.0🥇             | 644.1🥈         | 400.0🥇           |
| Vite 7.3.7              | 509.7🥇           | 415.0🥈             | 511.2🥇         | 429.8🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 842.4🥉         | 504.3🥉           |
| webpack 5.111.1 (Babel) | 1028.8          | 488.3🥈           |
| Vite 8.3.0              | 459.5🥇         | 456.3🥇           |
| Vite 7.3.7              | 575.7🥈         | 580.2             |

