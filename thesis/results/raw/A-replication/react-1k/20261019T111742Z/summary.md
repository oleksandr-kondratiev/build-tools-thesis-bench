Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name            | Startup (no cache) | Startup (with cache) | HMR     | Ready (no cache) | Page (no cache) |
| --------------- | ------------------ | -------------------- | ------- | ---------------- | --------------- |
| webpack 5.111.1 | 4057ms🥇           | 2727ms🥇             | 283ms🥈 | 2997ms🥈         | 1054ms🥇        |
| Vite 8.3.0      | 5553ms🥈           | 3950ms🥈             | 11ms🥇  | 160ms🥇          | 5395ms🥈        |

### Build metrics

| Name            | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| --------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1 | 3567ms🥈         | 1353ms🥈           | 847.4kB🥈   | 230.3kB🥈    | 177.2kB🥈   |
| Vite 8.3.0      | 401ms🥇          | 400ms🥇            | 825.6kB🥇   | 225.8kB🥇    | 173.9kB🥇   |

### Dev memory (MiB)

| Name            | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| --------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1 | 997.2🥈           | 927.0🥈             | 1003.4🥈        | 928.9🥈           |
| Vite 8.3.0      | 646.0🥇           | 398.1🥇             | 646.0🥇         | 398.1🥇           |

### Build memory (MiB)

| Name            | Peak (no cache) | Peak (with cache) |
| --------------- | --------------- | ----------------- |
| webpack 5.111.1 | 839.3🥈         | 504.0🥈           |
| Vite 8.3.0      | 458.8🥇         | 457.8🥇           |

