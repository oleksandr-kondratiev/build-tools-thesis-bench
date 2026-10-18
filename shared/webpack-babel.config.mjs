// @ts-check
// W5-B: the previous-generation webpack setup (thesis fork). Same as ./webpack.config.mjs, but
// minified by Terser (webpack's built-in default) instead of SWC. Not `extends`-ed from it,
// because webpack-merge would concatenate the minimizer arrays.
import { isProd, targetBrowser } from './constants.mjs';

export default {
  devtool: isProd ? false : undefined,
  target: ['web', `browserslist:${targetBrowser}`],
  resolve: {
    extensions: ['...', '.tsx', '.ts', '.jsx'],
  },
  cache: {
    type: 'filesystem',
    name: `webpack-babel-web-${isProd ? 'prod' : 'dev'}`,
  },
  optimization: {
    minimize: isProd,
  },
  experiments: {
    css: true,
    html: true,
  },
};
