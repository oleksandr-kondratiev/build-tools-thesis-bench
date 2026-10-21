Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name       | Startup (no cache) | Startup (with cache) | HMR    | Ready (no cache) | Page (no cache) |
| ---------- | ------------------ | -------------------- | ------ | ---------------- | --------------- |
| Vite 7.3.7 | 5233ms🥇           | 2917ms🥇             | 11ms🥇 | 162ms🥇          | 5071ms🥇        |

### Build metrics

| Name       | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ---------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| Vite 7.3.7 | 5852ms🥇         | 5805ms🥇           | 2501.6kB🥇  | 692.3kB🥇    | 539.0kB🥇   |

### Dev memory (MiB)

| Name       | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ---------- | ----------------- | ------------------- | --------------- | ----------------- |
| Vite 7.3.7 | 556.6🥇           | 308.6🥇             | 581.4🥇         | 315.3🥇           |

### Build memory (MiB)

| Name       | Peak (no cache) | Peak (with cache) |
| ---------- | --------------- | ----------------- |
| Vite 7.3.7 | 815.1🥇         | 857.9🥇           |

