// @ts-check
// V7 (thesis fork): Vite 7 (esbuild + Rollup).
import { targetVite } from '../../shared/constants.mjs';

export default {
  cacheDir: 'node_modules/.vite7',
  build: {
    target: targetVite,
  },
};
