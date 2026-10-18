// @ts-check
// babel-loader rule for the React cases in the W5-B configuration (thesis fork).
import { isProd, targetBrowser } from './constants.mjs';

export const babelReactRule = {
  test: /\.(js|ts|tsx|jsx)$/,
  exclude: /node_modules/,
  use: {
    loader: 'babel-loader',
    options: {
      babelrc: false,
      configFile: false,
      presets: [
        ['@babel/preset-env', { targets: targetBrowser, bugfixes: true }],
        [
          '@babel/preset-react',
          { runtime: 'automatic', development: !isProd },
        ],
      ],
      plugins: isProd ? [] : ['react-refresh/babel'],
    },
  },
};
