Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 3533ms🥇           | 2539ms🥈             | 234ms   | 2502ms🥉         | 1036ms🥇        |
| webpack 5.111.1 (Babel) | 4934ms🥈           | 2521ms🥇             | 232ms🥉 | 3882ms           | 1059ms🥈        |
| Vite 8.3.0              | 5258ms🥉           | 3726ms🥉             | 11ms🥇  | 158ms🥈          | 5099ms🥉        |
| Vite 7.3.7              | 5832ms             | 4311ms               | 12ms🥈  | 130ms🥇          | 5702ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 3044ms🥉         | 1124ms🥈           | 748.7kB🥉   | 212.8kB🥉    | 165.4kB🥉   |
| webpack 5.111.1 (Babel) | 28574ms          | 1135ms🥉           | 750.3kB     | 212.1kB🥇    | 165.2kB🥈   |
| Vite 8.3.0              | 373ms🥇          | 373ms🥇            | 747.1kB🥈   | 212.3kB🥈    | 165.1kB🥇   |
| Vite 7.3.7              | 2017ms🥈         | 2028ms             | 740.3kB🥇   | 213.6kB      | 166.5kB     |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 886.7🥉           | 806.0🥉             | 893.8🥉         | 824.9🥉           |
| webpack 5.111.1 (Babel) | 894.3             | 857.4               | 899.6           | 860.0             |
| Vite 8.3.0              | 617.1🥈           | 402.1🥇             | 617.1🥈         | 402.4🥇           |
| Vite 7.3.7              | 509.1🥇           | 406.6🥈             | 513.9🥇         | 419.8🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 644.0🥉         | 438.2🥉           |
| webpack 5.111.1 (Babel) | 839.5           | 433.1🥈           |
| Vite 8.3.0              | 407.9🥇         | 406.8🥇           |
| Vite 7.3.7              | 537.6🥈         | 534.4             |

