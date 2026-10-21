Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Recovered after retry

1 failed attempt(s); failed attempts are excluded from metrics.

- webpack 5.111.1 (Babel), memory, dev, iteration 1: Error: Dev server exited: {"code":1,"signal":null}

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- |
| webpack 5.111.1 (Babel) | 15255ms🥇          | 5556ms🥇             | 1046ms🥇 | 14244ms🥇        | 1035ms🥇        |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1 (Babel) | 23757ms🥇        | 3295ms🥇           | 2721.1kB🥇  | 676.3kB🥇    | 550.2kB🥇   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1 (Babel) | 1591.3🥇          | 1417.0🥇            | 1608.5🥇        | 1483.0🥇          |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1 (Babel) | 1466.5🥇        | 754.1🥇           |

