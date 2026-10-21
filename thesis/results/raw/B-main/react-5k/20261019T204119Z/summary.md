Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 8327ms🥉           | 4643ms🥉             | 806ms🥉 | 7398ms🥉         | 931ms🥇         |
| webpack 5.111.1 (Babel) | 14405ms            | 4707ms               | 842ms   | 13440ms          | 957ms🥈         |
| Vite 8.3.0              | 4229ms🥇           | 2304ms🥇             | 10ms🥇  | 160ms🥈          | 4070ms🥉        |
| Vite 7.3.7              | 5190ms🥈           | 2826ms🥈             | 11ms🥈  | 132ms🥇          | 5056ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 8699ms🥉         | 3036ms🥈           | 2710.7kB🥉  | 682.1kB🥈    | 555.1kB     |
| webpack 5.111.1 (Babel) | 22360ms          | 3092ms🥉           | 2721.1kB    | 676.3kB🥇    | 550.2kB🥉   |
| Vite 8.3.0              | 703ms🥇          | 704ms🥇            | 2541.6kB🥈  | 693.4kB      | 538.1kB🥇   |
| Vite 7.3.7              | 5521ms🥈         | 5534ms             | 2501.6kB🥇  | 692.3kB🥉    | 539.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2086.6            | 1120.4🥉            | 2140.5🥉        | 1832.8🥉          |
| webpack 5.111.1 (Babel) | 1437.1🥉          | 1508.2              | 2173.3          | 1933.0            |
| Vite 8.3.0              | 863.5🥈           | 375.1🥇             | 880.6🥈         | 375.1🥇           |
| Vite 7.3.7              | 676.6🥇           | 392.3🥈             | 686.6🥇         | 399.0🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1502.4🥉        | 960.9🥈           |
| webpack 5.111.1 (Babel) | 1904.9          | 972.2🥉           |
| Vite 8.3.0              | 853.8🥇         | 857.6🥇           |
| Vite 7.3.7              | 988.5🥈         | 981.6             |

