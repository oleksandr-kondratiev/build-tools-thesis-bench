Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 8335ms🥉           | 4852ms               | 843ms   | 7268ms🥉         | 1077ms🥇        |
| webpack 5.111.1 (Babel) | 13872ms            | 4820ms🥉             | 826ms🥉 | 12780ms          | 1108ms🥈        |
| Vite 8.3.0              | 6336ms🥇           | 4119ms🥇             | 11ms🥇  | 158ms🥈          | 6179ms🥉        |
| Vite 7.3.7              | 7176ms🥈           | 4670ms🥈             | 12ms🥈  | 130ms🥇          | 7042ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 8880ms🥉         | 3120ms🥈           | 2944.2kB🥉  | 736.0kB🥈    | 569.6kB     |
| webpack 5.111.1 (Babel) | 36964ms          | 3125ms🥉           | 2956.0kB    | 727.9kB🥇    | 568.1kB🥉   |
| Vite 8.3.0              | 715ms🥇          | 714ms🥇            | 2770.6kB🥈  | 757.3kB      | 553.7kB🥇   |
| Vite 7.3.7              | 5591ms🥈         | 5586ms             | 2729.6kB🥇  | 756.1kB🥉    | 555.4kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1965.0            | 1138.7🥉            | 2006.5🥉        | 1827.6🥉          |
| webpack 5.111.1 (Babel) | 1364.8🥉          | 1813.3              | 2021.0          | 1852.5            |
| Vite 8.3.0              | 914.1🥈           | 418.6🥇             | 924.2🥈         | 418.6🥇           |
| Vite 7.3.7              | 759.5🥇           | 460.0🥈             | 762.6🥇         | 469.9🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1488.2🥉        | 976.5🥈           |
| webpack 5.111.1 (Babel) | 1837.1          | 978.5🥉           |
| Vite 8.3.0              | 869.2🥇         | 870.6🥇           |
| Vite 7.3.7              | 1018.3🥈        | 1022.8            |

