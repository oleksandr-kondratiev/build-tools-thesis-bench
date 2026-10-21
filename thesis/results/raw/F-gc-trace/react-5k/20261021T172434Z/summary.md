Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name            | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| --------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1 | 9267ms🥇           | 5366ms🥇             | 915ms🥇 | 8079ms🥇         | 1026ms🥇        |

### Build metrics

| Name            | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| --------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1 | 9321ms🥇         | 3267ms🥇           | 2710.7kB🥇  | 682.1kB🥇    | 555.1kB🥇   |

### Dev memory (MiB)

| Name            | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| --------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1 | 1582.3🥇          | 1064.2🥇            | 1602.8🥇        | 1441.4🥇          |

### Build memory (MiB)

| Name            | Peak (no cache) | Peak (with cache) |
| --------------- | --------------- | ----------------- |
| webpack 5.111.1 | 1261.1🥇        | 763.0🥇           |

