// @ts-check
// W5-B (thesis fork): webpack + Terser. No loader, as in the W5-S config of this case.

export default {
  extends: '../../shared/webpack-babel.config.mjs',
  entry: './index.html',
};
