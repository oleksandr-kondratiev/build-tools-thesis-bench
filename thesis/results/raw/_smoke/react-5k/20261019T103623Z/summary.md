Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1         | 8542ms🥉           | 4609ms🥉             | 828ms🥉 | 7613ms🥉         | 929ms🥇         |
| webpack 5.111.1 (Babel) | 14386ms            | 4648ms               | 848ms   | 13417ms          | 969ms🥈         |
| Vite 8.3.0              | 4214ms🥇           | 3534ms🥇             | 10ms🥇  | 157ms🥈          | 4057ms🥉        |
| Vite 7.3.7              | 4873ms🥈           | 3780ms🥈             | 10ms🥈  | 134ms🥇          | 4739ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 8799ms🥉         | 3153ms🥉           | 2710.7kB🥉  | 682.1kB🥈    | 555.1kB     |
| webpack 5.111.1 (Babel) | 22214ms          | 3100ms🥈           | 2721.1kB    | 676.3kB🥇    | 550.2kB🥉   |
| Vite 8.3.0              | 692ms🥇          | 697ms🥇            | 2541.6kB🥈  | 693.4kB      | 538.1kB🥇   |
| Vite 7.3.7              | 5553ms🥈         | 5488ms             | 2501.6kB🥇  | 692.3kB🥉    | 539.0kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2099.1            | 1111.9🥉            | 2157.5🥉        | 1825.9🥉          |
| webpack 5.111.1 (Babel) | 1451.8🥉          | 1935.1              | 2187.0          | 1965.3            |
| Vite 8.3.0              | 852.1🥈           | 372.3🥇             | 871.9🥈         | 372.3🥇           |
| Vite 7.3.7              | 680.3🥇           | 384.1🥈             | 680.3🥇         | 389.8🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1495.7🥉        | 959.7🥈           |
| webpack 5.111.1 (Babel) | 1893.5          | 971.8🥉           |
| Vite 8.3.0              | 858.0🥇         | 857.5🥇           |
| Vite 7.3.7              | 1009.2🥈        | 1006.5            |

