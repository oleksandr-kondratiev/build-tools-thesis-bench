Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) | Requests (all routes) | Transferred kB |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- | --------------------- | -------------- |
| webpack 5.111.1         | 8407ms🥉           | 4667ms🥉             | 804ms🥉 | 7479ms🥉         | 925ms🥇         | 18🥇                  | 1324kB🥇       |
| webpack 5.111.1 (Babel) | 14347ms            | 4749ms               | 836ms   | 13391ms          | 958ms🥈         | 18🥈                  | 1494kB🥈       |
| Vite 8.3.0              | 4215ms🥇           | 2382ms🥇             | 10ms🥇  | 160ms🥈          | 4058ms🥉        | 10013🥉               | 41190kB        |
| Vite 7.3.7              | 5124ms🥈           | 2886ms🥈             | 11ms🥈  | 132ms🥇          | 4993ms          | 10013                 | 39592kB🥉      |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 8744ms🥉         | 3068ms🥈           | 2710.7kB🥉  | 682.1kB🥈    | 555.1kB     |
| webpack 5.111.1 (Babel) | 22403ms          | 3130ms🥉           | 2721.1kB    | 676.3kB🥇    | 550.2kB🥉   |
| Vite 8.3.0              | 707ms🥇          | 708ms🥇            | 2541.6kB🥈  | 693.4kB      | 538.1kB🥇   |
| Vite 7.3.7              | 5533ms🥈         | 5532ms             | 2501.6kB🥇  | 692.3kB🥉    | 539.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2089.3            | 1118.9🥉            | 2146.4🥉        | 1831.7🥉          |
| webpack 5.111.1 (Babel) | 1438.1🥉          | 1876.0              | 2188.5          | 1931.0            |
| Vite 8.3.0              | 863.4🥈           | 375.6🥇             | 881.6🥈         | 375.6🥇           |
| Vite 7.3.7              | 654.1🥇           | 390.2🥈             | 679.7🥇         | 395.3🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1499.5🥉        | 960.7🥈           |
| webpack 5.111.1 (Babel) | 1919.2          | 972.2🥉           |
| Vite 8.3.0              | 856.5🥇         | 848.5🥇           |
| Vite 7.3.7              | 981.1🥈         | 980.8             |

