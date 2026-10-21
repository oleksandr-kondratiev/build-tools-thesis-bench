Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name       | Startup (no cache) | Startup (with cache) | HMR    | Ready (no cache) | Page (no cache) |
| ---------- | ------------------ | -------------------- | ------ | ---------------- | --------------- |
| Vite 8.3.0 | 4040ms🥇           | 2406ms🥇             | 10ms🥇 | 194ms🥇          | 3846ms🥇        |

### Build metrics

| Name       | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ---------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| Vite 8.3.0 | 736ms🥇          | 739ms🥇            | 2541.6kB🥇  | 693.4kB🥇    | 538.1kB🥇   |

### Dev memory (MiB)

| Name       | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ---------- | ----------------- | ------------------- | --------------- | ----------------- |
| Vite 8.3.0 | 772.7🥇           | 325.0🥇             | 799.0🥇         | 325.0🥇           |

### Build memory (MiB)

| Name       | Peak (no cache) | Peak (with cache) |
| ---------- | --------------- | ----------------- |
| Vite 8.3.0 | 846.9🥇         | 856.6🥇           |

