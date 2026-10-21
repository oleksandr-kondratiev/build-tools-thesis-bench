Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name       | Startup (no cache) | Startup (with cache) | HMR    | Ready (no cache) | Page (no cache) |
| ---------- | ------------------ | -------------------- | ------ | ---------------- | --------------- |
| Vite 8.3.0 | 6797ms🥇           | 4398ms🥇             | 11ms🥇 | 192ms🥇          | 6606ms🥇        |

### Build metrics

| Name       | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ---------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| Vite 8.3.0 | 1206ms🥇         | 1198ms🥇           | 5232.3kB🥇  | 1407.1kB🥇   | 1000.2kB🥇  |

### Dev memory (MiB)

| Name       | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ---------- | ----------------- | ------------------- | --------------- | ----------------- |
| Vite 8.3.0 | 1158.1🥇          | 371.9🥇             | 1177.3🥇        | 371.9🥇           |

### Build memory (MiB)

| Name       | Peak (no cache) | Peak (with cache) |
| ---------- | --------------- | ----------------- |
| Vite 8.3.0 | 1403.8🥇        | 1402.6🥇          |

