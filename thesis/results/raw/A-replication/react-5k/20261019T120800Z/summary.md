Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name            | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| --------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1 | 8349ms🥈           | 4618ms🥈             | 805ms🥈 | 7416ms🥈         | 922ms🥇         |
| Vite 8.3.0      | 4275ms🥇           | 2289ms🥇             | 10ms🥇  | 160ms🥇          | 4115ms🥈        |

### Build metrics

| Name            | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| --------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1 | 8690ms🥈         | 3034ms🥈           | 2710.7kB🥈  | 682.1kB🥇    | 555.1kB🥈   |
| Vite 8.3.0      | 703ms🥇          | 702ms🥇            | 2541.6kB🥇  | 693.4kB🥈    | 538.1kB🥇   |

### Dev memory (MiB)

| Name            | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| --------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1 | 2092.4🥈          | 1115.1🥈            | 2147.3🥈        | 1825.1🥈          |
| Vite 8.3.0      | 860.9🥇           | 374.0🥇             | 878.7🥇         | 374.0🥇           |

### Build memory (MiB)

| Name            | Peak (no cache) | Peak (with cache) |
| --------------- | --------------- | ----------------- |
| webpack 5.111.1 | 1497.5🥈        | 961.0🥈           |
| Vite 8.3.0      | 852.6🥇         | 847.9🥇           |

