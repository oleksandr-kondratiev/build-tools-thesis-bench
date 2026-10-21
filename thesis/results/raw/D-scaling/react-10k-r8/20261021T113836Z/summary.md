Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- |
| webpack 5.111.1         | 11990ms🥉          | 6518ms🥉             | 1340ms🥉 | 10853ms🥉        | 1142ms🥇        |
| webpack 5.111.1 (Babel) | 20955ms            | 6569ms               | 1468ms   | 19777ms          | 1174ms🥈        |
| Vite 8.3.0              | 6306ms🥇           | 4239ms🥇             | 11ms🥇   | 157ms🥈          | 6150ms🥉        |
| Vite 7.3.7              | 7595ms🥈           | 4619ms🥈             | 12ms🥈   | 132ms🥇          | 7465ms          |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 13147ms🥉        | 4534ms🥉           | 4553.6kB🥉  | 1120.3kB🥈   | 868.5kB     |
| webpack 5.111.1 (Babel) | 43316ms          | 4459ms🥈           | 4570.6kB    | 1106.6kB🥇   | 864.6kB🥉   |
| Vite 8.3.0              | 983ms🥇          | 982ms🥇            | 4237.5kB🥈  | 1145.2kB     | 833.4kB🥇   |
| Vite 7.3.7              | 8371ms🥈         | 8427ms             | 4170.1kB🥇  | 1141.8kB🥉   | 834.3kB🥈   |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2512.8🥉          | 2176.6🥉            | 2546.3🥉        | 2450.7            |
| webpack 5.111.1 (Babel) | 2537.5            | 2404.9              | 2620.7          | 2429.9🥉          |
| Vite 8.3.0              | 1091.9🥈          | 443.4🥇             | 1110.1🥈        | 443.5🥇           |
| Vite 7.3.7              | 899.7🥇           | 453.1🥈             | 899.7🥇         | 468.1🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 1726.6🥉        | 1263.3🥉          |
| webpack 5.111.1 (Babel) | 2440.5          | 1245.1🥈          |
| Vite 8.3.0              | 1184.3🥇        | 1187.9🥇          |
| Vite 7.3.7              | 1412.3🥈        | 1423.0            |

