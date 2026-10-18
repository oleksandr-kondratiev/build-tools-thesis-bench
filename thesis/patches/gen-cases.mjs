// Generates the derived benchmark cases of the thesis fork from the upstream ones:
//
//   react-{1k,5k,10k}-hub   every component of the root route (src/f0.jsx + src/d0/**) imports a
//                           non-component module src/hub.js, so editing it re-executes O(k) modules
//   react-10k-r1 … r9       react-10k with only routes f0 … f(k-1) connected in src/index.jsx
//
//   node thesis/patches/gen-cases.mjs            (run from the repository root, after pnpm install)
//
// Generated cases are not committed (see .gitignore); they are recreated in the Docker image.
// node_modules is a symlink to the source case, so no lockfile entry is needed.
import { cpSync, existsSync, readFileSync, readdirSync, rmSync, statSync, symlinkSync, writeFileSync } from 'node:fs';
import path from 'node:path';

const casesDir = path.resolve('cases');

function copyCase(from, to, patchConfig) {
  const src = path.join(casesDir, from);
  const dst = path.join(casesDir, to);
  rmSync(dst, { recursive: true, force: true });
  cpSync(src, dst, {
    recursive: true,
    filter: (file) => !/[\\/](node_modules|dist)$/.test(file),
  });
  symlinkSync(`../${from}/node_modules`, path.join(dst, 'node_modules'));
  const pkgPath = path.join(dst, 'package.json');
  const pkg = JSON.parse(readFileSync(pkgPath, 'utf8'));
  pkg.name = to;
  pkg.private = true;
  writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + '\n');
  const cfgPath = path.join(dst, 'benchmark-config.mjs');
  writeFileSync(cfgPath, patchConfig(readFileSync(cfgPath, 'utf8')));
  return dst;
}

function walk(dir, out = []) {
  for (const name of readdirSync(dir)) {
    const file = path.join(dir, name);
    if (statSync(file).isDirectory()) walk(file, out);
    else if (file.endsWith('.jsx')) out.push(file);
  }
  return out;
}

// ---- hub cases ----
for (const base of ['react-1k', 'react-5k', 'react-10k']) {
  const dst = copyCase(base, `${base}-hub`, (cfg) =>
    cfg.replace(/leafFile: '([^']+)',/, "leafFile: '$1',\n  hubFile: 'hub.js',"),
  );
  const srcDir = path.join(dst, 'src');
  writeFileSync(
    path.join(srcDir, 'hub.js'),
    "// Thesis fork: hub module imported by every component of the root route.\nexport const HUB = 'hub-0';\n",
  );
  const files = [path.join(srcDir, 'f0.jsx'), ...walk(path.join(srcDir, 'd0'))];
  for (const file of files) {
    let rel = path.relative(path.dirname(file), path.join(srcDir, 'hub.js'));
    if (!rel.startsWith('.')) rel = `./${rel}`;
    const code = readFileSync(file, 'utf8');
    const lines = code.split('\n');
    lines.splice(1, 0, `import { HUB } from '${rel}';`);
    let patched = lines.join('\n');
    if (!patched.includes('<div className="">')) throw new Error(`no root <div> in ${file}`);
    patched = patched.replace('<div className="">', '<div className="" data-hub={HUB}>');
    writeFileSync(file, patched);
  }
  console.log(`${base}-hub: ${files.length} components import src/hub.js`);
}

// ---- scaling cases ----
const base10k = readFileSync(path.join(casesDir, 'react-10k/src/index.jsx'), 'utf8');
for (let k = 1; k <= 9; k++) {
  const dst = copyCase('react-10k', `react-10k-r${k}`, (cfg) => cfg);
  // Keep App0 (always rendered) and lazy routes App1 … App(k-1).
  const kept = (n) => Number(n) < k;
  const index = base10k
    .split('\n')
    .filter((line) => {
      const lazy = /^const App(\d+) = React\.lazy/.exec(line);
      const route = /<Route path="\/f(\d+)"/.exec(line);
      return !(lazy && !kept(lazy[1])) && !(route && !kept(route[1]));
    })
    .join('\n');
  writeFileSync(path.join(dst, 'src/index.jsx'), index);
  // Remove the subtrees that are no longer reachable, so tools that scan src/ see the same graph.
  for (let r = k; r <= 8; r++) rmSync(path.join(dst, `src/f${r}.jsx`));
  const reachable = new Set(['d0']);
  for (let r = 1; r < k; r++) {
    for (const m of readFileSync(path.join(dst, `src/f${r}.jsx`), 'utf8').matchAll(/'\.\/(d\d+)\//g))
      reachable.add(m[1]);
  }
  for (const d of readdirSync(path.join(dst, 'src')))
    if (/^d\d+$/.test(d) && !reachable.has(d)) rmSync(path.join(dst, 'src', d), { recursive: true });
  console.log(`react-10k-r${k}: routes f0…f${k - 1}, subtrees ${[...reachable].sort().join(',')}`);
}

if (!existsSync(path.join(casesDir, 'react-10k-r9/src/d9'))) throw new Error('r9 must contain the full react-10k graph');
