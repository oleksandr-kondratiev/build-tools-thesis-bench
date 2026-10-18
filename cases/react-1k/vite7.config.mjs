// @ts-check
// V7 (thesis fork): Vite 7 (esbuild + Rollup) with @vitejs/plugin-react 5.
import react from 'vite7-plugin-react';
import { targetVite } from '../../shared/constants.mjs';

export default {
  plugins: [react()],
  cacheDir: 'node_modules/.vite7',
  build: {
    target: targetVite,
  },
  optimizeDeps: {
    exclude: ['@iconify-icons/material-symbols'],
  },
};
