Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name            | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| --------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1 | 8920ms🥇           | 5310ms🥇             | 906ms🥇 | 7922ms🥇         | 1008ms🥇        |

### Build metrics

| Name            | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| --------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1 | 9260ms🥇         | 3241ms🥇           | 2710.7kB🥇  | 682.1kB🥇    | 555.1kB🥇   |

### Dev memory (MiB)

| Name            | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| --------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1 | 1618.8🥇          | 1057.9🥇            | 1631.9🥇        | 1476.8🥇          |

### Build memory (MiB)

| Name            | Peak (no cache) | Peak (with cache) |
| --------------- | --------------- | ----------------- |
| webpack 5.111.1 | 1261.4🥇        | 760.2🥇           |

