Timing and memory are measured in separate passes.

Memory: process-tree RSS, MiB; median, natural GC.

### Build metrics

| Name                    | Build (no cache) | Build (with cache) | Output size | Gzipped size | Brotli size |
| ----------------------- | ---------------- | ------------------ | ----------- | ------------ | ----------- |
| webpack 5.111.1         | 5119ms🥈         | 1322ms🥈           | 1792.4kB🥉  | 547.6kB🥈    | 449.1kB🥈   |
| webpack 5.111.1 (Babel) | 17479ms          | 1344ms🥉           | 1813.8kB    | 548.4kB🥉    | 450.0kB🥉   |
| Vite 8.3.0              | 926ms🥇          | 916ms🥇            | 1771.2kB🥇  | 541.7kB🥇    | 448.9kB🥇   |
| Vite 7.3.7              | 6306ms🥉         | 6277ms             | 1775.9kB🥈  | 557.2kB      | 464.8kB     |

### Build memory (MiB)

| Name                    | Peak (no cache) | Peak (with cache) |
| ----------------------- | --------------- | ----------------- |
| webpack 5.111.1         | 979.2🥇         | 493.5🥈           |
| webpack 5.111.1 (Babel) | 1693.7          | 492.1🥇           |
| Vite 8.3.0              | 983.1🥈         | 980.8🥉           |
| Vite 7.3.7              | 1187.3🥉        | 1179.5            |

