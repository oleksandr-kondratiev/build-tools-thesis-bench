Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Recovered after retry

1 failed attempt(s); failed attempts are excluded from metrics.

- webpack 5.111.1 (Babel), memory, dev, iteration 2: Error: Dev server exited: {"code":1,"signal":null}

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- |
| webpack 5.111.1 (Babel) | 15572ms🥇          | 5501ms🥇             | 1020ms🥇 | 14480ms🥇        | 1055ms🥇        |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1 (Babel) | 23357ms🥇        | 3342ms🥇           | 2721.1kB🥇  | 676.3kB🥇    | 550.2kB🥇   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1 (Babel) | 1608.9🥇          | 1418.7🥇            | 1625.1🥇        | 1453.1🥇          |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1 (Babel) | 1409.0🥇        | 761.8🥇           |

