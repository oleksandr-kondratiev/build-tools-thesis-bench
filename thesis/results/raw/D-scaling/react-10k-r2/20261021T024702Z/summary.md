Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 4768ms🥇           | 3145ms🥇             | 387ms   | 3753ms🥉         | 1017ms🥇        |
| webpack 5.111.1 (Babel) | 7232ms             | 3151ms🥈             | 382ms🥉 | 6190ms           | 1043ms🥈        |
| Vite 8.3.0              | 5724ms🥈           | 3972ms🥉             | 11ms🥇  | 159ms🥈          | 5566ms🥉        |
| Vite 7.3.7              | 6463ms🥉           | 4501ms               | 12ms🥈  | 130ms🥇          | 6333ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 4523ms🥉         | 1660ms🥈           | 1291.4kB🥉  | 341.4kB🥈    | 264.2kB     |
| webpack 5.111.1 (Babel) | 29936ms          | 1662ms🥉           | 1297.6kB    | 338.9kB🥇    | 263.7kB🥉   |
| Vite 8.3.0              | 448ms🥇          | 449ms🥇            | 1247.5kB🥈  | 345.8kB🥉    | 259.8kB🥇   |
| Vite 7.3.7              | 2986ms🥈         | 2982ms             | 1232.9kB🥇  | 346.7kB      | 261.4kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1167.5            | 1023.6🥉            | 1181.2          | 1062.4🥉          |
| webpack 5.111.1 (Babel) | 1116.9🥉          | 1088.1              | 1176.8🥉        | 1106.7            |
| Vite 8.3.0              | 689.7🥈           | 387.1🥇             | 689.7🥈         | 388.9🥇           |
| Vite 7.3.7              | 526.8🥇           | 404.5🥈             | 537.1🥇         | 418.0🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 909.5🥉         | 587.1🥉           |
| webpack 5.111.1 (Babel) | 1294.8          | 583.0🥈           |
| Vite 8.3.0              | 527.8🥇         | 532.8🥇           |
| Vite 7.3.7              | 661.2🥈         | 670.8             |

