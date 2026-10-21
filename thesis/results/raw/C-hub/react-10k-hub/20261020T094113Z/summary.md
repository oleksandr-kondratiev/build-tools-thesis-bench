Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Development metrics

| Name                    | Startup (no cache) | Startup (with cache) | HMR      | Ready (no cache) | Page (no cache) | Hub HMR  |
| ----------------------- | ------------------ | -------------------- | -------- | ---------------- | --------------- | -------- |
| webpack 5.111.1         | 14437ms🥉          | 7718ms🥉             | 1994ms🥉 | 13253ms🥉        | 1199ms🥇        | 1890ms🥉 |
| webpack 5.111.1 (Babel) | 25789ms            | 7899ms               | 2152ms   | 24558ms          | 1237ms🥈        | 2012ms   |
| Vite 8.3.0              | 6908ms🥇           | 4297ms🥇             | 12ms🥇   | 158ms🥈          | 6749ms🥉        | 1761ms🥈 |
| Vite 7.3.7              | 8404ms🥈           | 4808ms🥈             | 13ms🥈   | 131ms🥇          | 8273ms          | 1718ms🥇 |

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 16325ms🥉        | 5718ms🥉           | 5657.4kB🥉  | 1361.8kB🥈   | 1044.1kB    |
| webpack 5.111.1 (Babel) | 46663ms          | 5682ms🥈           | 5677.9kB    | 1344.1kB🥇   | 1040.7kB🥉  |
| Vite 8.3.0              | 1187ms🥇         | 1185ms🥇           | 5245.3kB🥈  | 1407.4kB     | 1001.5kB🥇  |
| Vite 7.3.7              | 10620ms🥈        | 10640ms            | 5160.3kB🥇  | 1403.0kB🥉   | 1002.6kB🥈  |

### Dev memory (MiB)

| Name                    | Steady (no cache) | Steady (with cache) | Peak (no cache) | Peak (with cache) |
| ----------------------- | ----------------- | ------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 3853.0            | 2603.3🥉            | 3886.2          | 2692.3            |
| webpack 5.111.1 (Babel) | 2801.7🥉          | 2615.5              | 3256.8🥉        | 2661.0🥉          |
| Vite 8.3.0              | 1362.0🥈          | 461.4🥇             | 1368.0🥈        | 461.8🥇           |
| Vite 7.3.7              | 1039.3🥇          | 513.1🥈             | 1046.1🥇        | 520.8🥈           |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 2229.0🥉        | 1539.6🥉          |
| webpack 5.111.1 (Babel) | 2606.3          | 1518.3🥈          |
| Vite 8.3.0              | 1396.5🥇        | 1396.6🥇          |
| Vite 7.3.7              | 1585.0🥈        | 1626.0            |

