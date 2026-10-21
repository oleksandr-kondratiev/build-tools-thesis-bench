Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name       | Startup (no cache) | Startup (with cache) | HMR    | Ready (no cache) | Page (no cache) |
| ---------- | ------------------ | -------------------- | ------ | ---------------- | --------------- |
| Vite 8.3.0 | 3999ms🥇           | 2341ms🥇             | 10ms🥇 | 161ms🥇          | 3838ms🥇        |

### Build metrics

| Name       | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ---------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| Vite 8.3.0 | 704ms🥇          | 704ms🥇            | 2541.6kB🥇  | 693.4kB🥇    | 538.1kB🥇   |

### Dev memory (MiB)

| Name       | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ---------- | ----------------- | ------------------- | --------------- | ----------------- |
| Vite 8.3.0 | 766.4🥇           | 312.6🥇             | 786.9🥇         | 312.6🥇           |

### Build memory (MiB)

| Name       | Peak (no cache) | Peak (with cache) |
| ---------- | --------------- | ----------------- |
| Vite 8.3.0 | 856.0🥇         | 848.4🥇           |

