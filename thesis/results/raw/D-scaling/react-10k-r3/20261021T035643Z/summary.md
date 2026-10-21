Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 5952ms🥈           | 3750ms🥈             | 526ms   | 4872ms🥉         | 1058ms🥇        |
| webpack 5.111.1 (Babel) | 9501ms             | 3723ms🥇             | 520ms🥉 | 8434ms           | 1064ms🥈        |
| Vite 8.3.0              | 5867ms🥇           | 4030ms🥉             | 11ms🥇  | 159ms🥈          | 5708ms🥉        |
| Vite 7.3.7              | 6483ms🥉           | 4519ms               | 12ms🥈  | 130ms🥇          | 6353ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 5967ms🥉         | 2148ms🥈           | 1846.8kB🥉  | 473.8kB🥈    | 367.1kB     |
| webpack 5.111.1 (Babel) | 32423ms          | 2156ms🥉           | 1854.9kB    | 469.5kB🥇    | 365.8kB🥉   |
| Vite 8.3.0              | 531ms🥇          | 531ms🥇            | 1759.7kB🥈  | 484.2kB🥉    | 358.5kB🥇   |
| Vite 7.3.7              | 3823ms🥈         | 3818ms             | 1736.3kB🥇  | 484.3kB      | 360.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1398.3🥉          | 1265.6🥉            | 1419.3🥉        | 1296.5🥉          |
| webpack 5.111.1 (Babel) | 1431.3            | 1265.9              | 1474.0          | 1321.5            |
| Vite 8.3.0              | 745.1🥈           | 385.9🥇             | 750.0🥈         | 385.9🥇           |
| Vite 7.3.7              | 567.0🥇           | 426.6🥈             | 622.2🥇         | 437.3🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1099.4🥉        | 707.8🥉           |
| webpack 5.111.1 (Babel) | 1640.8          | 701.1🥈           |
| Vite 8.3.0              | 658.5🥇         | 659.2🥇           |
| Vite 7.3.7              | 714.5🥈         | 718.0             |

