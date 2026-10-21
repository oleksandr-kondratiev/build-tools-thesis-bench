Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name            | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) |
| --------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- |
| webpack 5.111.1 | 14218ms🥈          | 7612ms🥈             | 1793ms🥈 | 13044ms🥈        | 1188ms🥇        |
| Vite 8.3.0      | 6432ms🥇           | 4117ms🥇             | 11ms🥇   | 160ms🥇          | 6273ms🥈        |

### Build metrics

| Name            | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| --------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1 | 16180ms🥈        | 5405ms🥈           | 5638.3kB🥈  | 1361.1kB🥇   | 1044.0kB🥈  |
| Vite 8.3.0      | 1166ms🥇         | 1165ms🥇           | 5232.3kB🥇  | 1407.1kB🥈   | 1000.2kB🥇  |

### Dev memory (MiB)

| Name            | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| --------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1 | 2615.5🥈          | 2654.6🥈            | 2749.6🥈        | 2704.6🥈          |
| Vite 8.3.0      | 1295.4🥇          | 446.2🥇             | 1300.5🥇        | 447.1🥇           |

### Build memory (MiB)

| Name            | Peak (no cache) | Peak (with cache) |
| --------------- | --------------- | ----------------- |
| webpack 5.111.1 | 2231.8🥈        | 1523.4🥈          |
| Vite 8.3.0      | 1383.3🥇        | 1384.1🥇          |

