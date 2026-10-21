Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name       | Startup (no cache) | Startup (with cache) | HMR    | Ready (no cache) | Page (no cache) |
| ---------- | ------------------ | -------------------- | ------ | ---------------- | --------------- |
| Vite 7.3.7 | 8468ms🥇           | 5160ms🥇             | 13ms🥇 | 162ms🥇          | 8302ms🥇        |

### Build metrics

| Name       | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ---------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| Vite 7.3.7 | 10885ms🥇        | 10901ms🥇          | 5147.2kB🥇  | 1402.4kB🥇   | 1001.5kB🥇  |

### Dev memory (MiB)

| Name       | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ---------- | ----------------- | ------------------- | --------------- | ----------------- |
| Vite 7.3.7 | 881.6🥇           | 353.3🥇             | 881.6🥇         | 363.6🥇           |

### Build memory (MiB)

| Name       | Peak (no cache) | Peak (with cache) |
| ---------- | --------------- | ----------------- |
| Vite 7.3.7 | 1351.7🥇        | 1310.1🥇          |

