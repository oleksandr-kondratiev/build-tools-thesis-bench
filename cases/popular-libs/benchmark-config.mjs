export const config = {
  supportedTools: [
    'rspack',
    'rsbuild',
    'vite',
    'rollup',
    'rolldown',
    'webpack',
    'webpack-babel',
    'vite7',
    'esbuild',
    'farm',
    'utoo',
    // Parcel cannot bundle Zod
    // https://github.com/parcel-bundler/parcel/issues/10175
    // 'parcel',
  ],
  dev: false,
};
