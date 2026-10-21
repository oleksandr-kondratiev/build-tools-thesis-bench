Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 3669ms🥇           | 2562ms🥈             | 247ms   | 2587ms🥉         | 1082ms🥇        |
| webpack 5.111.1 (Babel) | 5151ms🥉           | 2505ms🥇             | 240ms🥉 | 4062ms           | 1089ms🥈        |
| Vite 8.3.0              | 5085ms🥈           | 4665ms🥉             | 11ms🥇  | 163ms🥈          | 4922ms🥉        |
| Vite 7.3.7              | 6439ms             | 6209ms               | 17ms🥈  | 134ms🥇          | 6305ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 3137ms🥉         | 1148ms🥈           | 748.7kB🥉   | 212.8kB🥉    | 165.4kB🥉   |
| webpack 5.111.1 (Babel) | 28430ms          | 1171ms🥉           | 750.3kB     | 212.1kB🥇    | 165.2kB🥈   |
| Vite 8.3.0              | 375ms🥇          | 383ms🥇            | 747.1kB🥈   | 212.3kB🥈    | 165.1kB🥇   |
| Vite 7.3.7              | 2060ms🥈         | 2061ms             | 740.3kB🥇   | 213.6kB      | 166.5kB     |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 859.5             | 804.8🥉             | 867.7           | 826.1🥉           |
| webpack 5.111.1 (Babel) | 853.0🥉           | 872.9               | 857.2🥉         | 873.2             |
| Vite 8.3.0              | 607.9🥈           | 400.7🥇             | 607.9🥈         | 400.7🥇           |
| Vite 7.3.7              | 515.8🥇           | 420.8🥈             | 515.8🥇         | 429.8🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 640.4🥉         | 444.1🥉           |
| webpack 5.111.1 (Babel) | 835.0           | 432.9🥈           |
| Vite 8.3.0              | 394.8🥇         | 414.6🥇           |
| Vite 7.3.7              | 537.0🥈         | 532.6             |

