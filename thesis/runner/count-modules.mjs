// Counts graph size |V| of a case from a webpack stats file (development mode, so that modules are
// not concatenated). Used as the X axis of the log-log regression in series D (thesis, p. 3.3.2).
//   node thesis/runner/count-modules.mjs <stats.json> <case>
import { readFileSync } from 'node:fs';

const [statsPath, caseName] = process.argv.slice(2);
const stats = JSON.parse(readFileSync(statsPath, 'utf8'));

const leaves = [];
const walk = (mods = []) => {
  for (const m of mods) {
    if (Array.isArray(m.modules) && m.modules.length) walk(m.modules); // concatenated module
    else leaves.push(m);
  }
};
walk(stats.modules);

const isRuntime = (m) => String(m.identifier ?? m.name ?? '').startsWith('webpack/runtime');
const graph = leaves.filter((m) => !isRuntime(m));
const fromNodeModules = graph.filter((m) => /[\\/]node_modules[\\/]/.test(m.nameForCondition ?? m.identifier ?? ''));
const edges = graph.reduce((n, m) => n + (m.reasons?.length ?? 0), 0);

console.log(JSON.stringify({
  case: caseName,
  modules_total: graph.length,
  modules_src: graph.length - fromNodeModules.length,
  modules_node_modules: fromNodeModules.length,
  edges_reasons: edges,
  webpack: stats.version,
}));
