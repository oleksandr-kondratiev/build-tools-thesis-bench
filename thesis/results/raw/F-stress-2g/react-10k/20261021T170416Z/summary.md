Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name       | Startup (no cache) | Startup (with cache) | HMR    | Ready (no cache) | Page (no cache) |
| ---------- | ------------------ | -------------------- | ------ | ---------------- | --------------- |
| Vite 8.3.0 | 6998ms🥇           | 4409ms🥇             | 11ms🥇 | 160ms🥇          | 6839ms🥇        |

### Build metrics

| Name       | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ---------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| Vite 8.3.0 | 1169ms🥇         | 1166ms🥇           | 5232.3kB🥇  | 1407.1kB🥇   | 1000.2kB🥇  |

### Dev memory (MiB)

| Name       | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ---------- | ----------------- | ------------------- | --------------- | ----------------- |
| Vite 8.3.0 | 1161.0🥇          | 377.4🥇             | 1175.8🥇        | 377.4🥇           |

### Build memory (MiB)

| Name       | Peak (no cache) | Peak (with cache) |
| ---------- | --------------- | ----------------- |
| Vite 8.3.0 | 1401.0🥇        | 1396.5🥇          |

