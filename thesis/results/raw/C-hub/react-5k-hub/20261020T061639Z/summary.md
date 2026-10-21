Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) | Hub HMR  |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- | -------- |
| webpack 5.111.1         | 8428ms🥉           | 4686ms🥉             | 822ms🥉 | 7484ms🥉         | 932ms🥇         | 895ms🥇  |
| webpack 5.111.1 (Babel) | 14516ms            | 4894ms               | 829ms   | 13566ms          | 967ms🥈         | 924ms🥈  |
| Vite 8.3.0              | 4569ms🥇           | 2377ms🥇             | 10ms🥇  | 159ms🥈          | 4409ms🥉        | 1479ms   |
| Vite 7.3.7              | 5193ms🥈           | 2870ms🥈             | 11ms🥈  | 131ms🥇          | 5062ms          | 1247ms🥉 |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 8778ms🥉         | 3088ms🥈           | 2722.7kB🥉  | 682.6kB🥈    | 555.6kB     |
| webpack 5.111.1 (Babel) | 22489ms          | 3154ms🥉           | 2733.1kB    | 676.8kB🥇    | 550.5kB🥉   |
| Vite 8.3.0              | 712ms🥇          | 713ms🥇            | 2549.8kB🥈  | 693.6kB      | 538.4kB🥇   |
| Vite 7.3.7              | 5558ms🥈         | 5582ms             | 2509.8kB🥇  | 692.7kB🥉    | 539.7kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2324.5            | 1998.3              | 2607.4🥉        | 2065.0🥉          |
| webpack 5.111.1 (Babel) | 1716.8🥉          | 1672.9🥉            | 2685.2          | 2075.6            |
| Vite 8.3.0              | 873.4🥈           | 401.7🥇             | 888.4🥈         | 402.2🥇           |
| Vite 7.3.7              | 689.7🥇           | 403.8🥈             | 698.1🥇         | 409.0🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1494.4🥉        | 967.4🥈           |
| webpack 5.111.1 (Babel) | 1885.6          | 978.8🥉           |
| Vite 8.3.0              | 856.7🥇         | 859.6🥇           |
| Vite 7.3.7              | 987.9🥈         | 990.6             |

