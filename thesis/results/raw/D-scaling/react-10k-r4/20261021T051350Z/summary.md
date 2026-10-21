Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 7180ms🥉           | 4200ms🥈             | 682ms   | 6121ms🥉         | 1070ms🥇        |
| webpack 5.111.1 (Babel) | 11738ms            | 4248ms🥉             | 673ms🥉 | 10593ms          | 1091ms🥈        |
| Vite 8.3.0              | 6164ms🥇           | 4091ms🥇             | 11ms🥇  | 158ms🥈          | 6005ms🥉        |
| Vite 7.3.7              | 7010ms🥈           | 4675ms               | 12ms🥈  | 130ms🥇          | 6880ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 7359ms🥉         | 2614ms🥉           | 2406.4kB🥉  | 607.5kB🥈    | 471.0kB     |
| webpack 5.111.1 (Babel) | 34719ms          | 2604ms🥈           | 2416.4kB    | 601.3kB🥇    | 469.7kB🥉   |
| Vite 8.3.0              | 619ms🥇          | 616ms🥇            | 2276.1kB🥈  | 625.2kB      | 458.8kB🥇   |
| Vite 7.3.7              | 4708ms🥈         | 4710ms             | 2243.9kB🥇  | 624.7kB🥉    | 460.4kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1674.2🥉          | 1460.9              | 1709.5🥉        | 1582.4🥉          |
| webpack 5.111.1 (Babel) | 1727.3            | 1445.2🥉            | 1755.7          | 1609.7            |
| Vite 8.3.0              | 824.2🥈           | 411.8🥇             | 833.2🥈         | 412.5🥇           |
| Vite 7.3.7              | 670.6🥇           | 447.8🥈             | 673.3🥇         | 455.2🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1271.4🥉        | 831.9🥉           |
| webpack 5.111.1 (Babel) | 1862.9          | 825.0🥈           |
| Vite 8.3.0              | 780.2🥇         | 781.1🥇           |
| Vite 7.3.7              | 874.0🥈         | 865.6             |

