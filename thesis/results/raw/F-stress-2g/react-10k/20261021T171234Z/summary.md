Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name       | Startup (no cache) | Startup (with cache) | HMR    | Ready (no cache) | Page (no cache) |
| ---------- | ------------------ | -------------------- | ------ | ---------------- | --------------- |
| Vite 7.3.7 | 8539ms🥇           | 4998ms🥇             | 13ms🥇 | 133ms🥇          | 8404ms🥇        |

### Build metrics

| Name       | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ---------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| Vite 7.3.7 | 10900ms🥇        | 10940ms🥇          | 5147.2kB🥇  | 1402.4kB🥇   | 1001.5kB🥇  |

### Dev memory (MiB)

| Name       | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ---------- | ----------------- | ------------------- | --------------- | ----------------- |
| Vite 7.3.7 | 857.5🥇           | 340.4🥇             | 857.5🥇         | 353.8🥇           |

### Build memory (MiB)

| Name       | Peak (no cache) | Peak (with cache) |
| ---------- | --------------- | ----------------- |
| Vite 7.3.7 | 1370.4🥇        | 1360.0🥇          |

