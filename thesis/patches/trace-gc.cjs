// Thesis fork, series Fgc: Node refuses --trace-gc in NODE_OPTIONS, so enable it at runtime
// through NODE_OPTIONS="--require /bench/thesis/patches/trace-gc.cjs" (inherited by child processes).
require('node:v8').setFlagsFromString('--trace-gc');
