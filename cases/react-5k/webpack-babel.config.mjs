// @ts-check
// W5-B (thesis fork): webpack + babel-loader + Terser.
import ReactRefreshWebpackPlugin from '@pmmmwh/react-refresh-webpack-plugin';
import { isProd } from '../../shared/constants.mjs';
import { babelReactRule } from '../../shared/babel-react.mjs';

export default {
  extends: '../../shared/webpack-babel.config.mjs',
  entry: './index.html',
  module: {
    rules: [babelReactRule],
  },
  plugins: [isProd ? null : new ReactRefreshWebpackPlugin()].filter(Boolean),
};
