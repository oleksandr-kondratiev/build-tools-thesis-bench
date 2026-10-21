Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 9512ms🥉           | 5494ms               | 987ms🥉 | 8391ms🥉         | 1108ms🥇        |
| webpack 5.111.1 (Babel) | 16131ms            | 5429ms🥉             | 988ms   | 14999ms          | 1125ms🥈        |
| Vite 8.3.0              | 6489ms🥇           | 4195ms🥇             | 11ms🥇  | 159ms🥈          | 6330ms🥉        |
| Vite 7.3.7              | 7612ms🥈           | 4738ms🥈             | 12ms🥈  | 132ms🥇          | 7480ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 10213ms🥉        | 3780ms🥉           | 3478.1kB🥉  | 860.2kB🥈    | 665.7kB     |
| webpack 5.111.1 (Babel) | 38694ms          | 3686ms🥈           | 3491.7kB    | 850.3kB🥇    | 663.6kB🥉   |
| Vite 8.3.0              | 800ms🥇          | 798ms🥇            | 3261.3kB🥈  | 887.5kB      | 646.1kB🥇   |
| Vite 7.3.7              | 6476ms🥈         | 6466ms             | 3211.5kB🥇  | 885.7kB🥉    | 647.2kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1546.5🥉          | 2004.9              | 2242.3🥉        | 2058.7            |
| webpack 5.111.1 (Babel) | 2248.2            | 1974.1🥉            | 2322.3          | 2021.1🥉          |
| Vite 8.3.0              | 980.6🥈           | 435.1🥇             | 994.0🥈         | 435.2🥇           |
| Vite 7.3.7              | 786.8🥇           | 463.6🥈             | 801.8🥇         | 473.9🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1622.4🥉        | 1113.4🥉          |
| webpack 5.111.1 (Babel) | 2339.9          | 980.3🥈           |
| Vite 8.3.0              | 972.9🥇         | 976.9🥇           |
| Vite 7.3.7              | 1160.0🥈        | 1147.2            |

