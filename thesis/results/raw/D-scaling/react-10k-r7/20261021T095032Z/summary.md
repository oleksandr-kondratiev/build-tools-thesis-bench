Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- |
| webpack 5.111.1         | 10716ms🥉          | 5981ms🥉             | 1169ms🥉 | 9602ms🥉         | 1125ms🥇        |
| webpack 5.111.1 (Babel) | 18555ms            | 6038ms               | 1185ms   | 17399ms          | 1148ms🥈        |
| Vite 8.3.0              | 6171ms🥇           | 4001ms🥇             | 11ms🥇   | 159ms🥈          | 6014ms🥉        |
| Vite 7.3.7              | 7861ms🥈           | 4870ms🥈             | 12ms🥈   | 130ms🥇          | 7732ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 11649ms🥉        | 4227ms🥉           | 4027.7kB🥉  | 995.5kB🥈    | 770.6kB     |
| webpack 5.111.1 (Babel) | 40491ms          | 4048ms🥈           | 4042.9kB    | 983.6kB🥇    | 768.3kB🥉   |
| Vite 8.3.0              | 892ms🥇          | 889ms🥇            | 3756.6kB🥈  | 1020.3kB     | 741.2kB🥇   |
| Vite 7.3.7              | 7531ms🥈         | 7510ms             | 3698.0kB🥇  | 1017.7kB🥉   | 742.2kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1731.6🥉          | 2247.1              | 2441.2🥉        | 2311.5            |
| webpack 5.111.1 (Babel) | 2384.3            | 2135.1🥉            | 2451.5          | 2186.2🥉          |
| Vite 8.3.0              | 1035.5🥈          | 436.3🥇             | 1047.9🥈        | 436.3🥇           |
| Vite 7.3.7              | 834.2🥇           | 455.6🥈             | 883.6🥇         | 465.1🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1656.5🥉        | 1258.4🥉          |
| webpack 5.111.1 (Babel) | 2239.9          | 1199.0🥈          |
| Vite 8.3.0              | 1081.8🥇        | 1077.5🥇          |
| Vite 7.3.7              | 1277.6🥈        | 1279.6            |

