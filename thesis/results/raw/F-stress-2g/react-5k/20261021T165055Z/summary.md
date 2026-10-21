Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name       | Startup (no cache) | Startup (with cache) | HMR    | Ready (no cache) | Page (no cache) |
| ---------- | ------------------ | -------------------- | ------ | ---------------- | --------------- |
| Vite 7.3.7 | 4954ms🥇           | 2850ms🥇             | 11ms🥇 | 133ms🥇          | 4821ms🥇        |

### Build metrics

| Name       | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ---------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| Vite 7.3.7 | 5832ms🥇         | 5874ms🥇           | 2501.6kB🥇  | 692.3kB🥇    | 539.0kB🥇   |

### Dev memory (MiB)

| Name       | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ---------- | ----------------- | ------------------- | --------------- | ----------------- |
| Vite 7.3.7 | 551.3🥇           | 308.4🥇             | 567.8🥇         | 313.1🥇           |

### Build memory (MiB)

| Name       | Peak (no cache) | Peak (with cache) |
| ---------- | --------------- | ----------------- |
| Vite 7.3.7 | 863.1🥇         | 848.7🥇           |

