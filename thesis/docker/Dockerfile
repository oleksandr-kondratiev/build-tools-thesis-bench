# Benchmark image: the fork's code is BAKED into the image (no bind mount of sources),
# only the results directory is mounted at run time.
#
# Build from the repository root:
#   docker build -f thesis/docker/Dockerfile \
#     --build-arg GIT_SHA="$(git rev-parse HEAD)" \
#     -t thesis-bench:"$(git rev-parse --short HEAD)" -t thesis-bench:latest .
#
# Pin the base image after the first successful build: replace the tag below with
# node:24.x.y-bookworm (upstream CI uses Node 24.21.0) or with an @sha256 digest.
ARG NODE_IMAGE=node:24-bookworm
FROM ${NODE_IMAGE}

ARG GIT_SHA=unknown
LABEL org.opencontainers.image.title="thesis-bench" \
      org.opencontainers.image.revision="${GIT_SHA}" \
      org.opencontainers.image.licenses="MIT"

# Shared libraries for Chrome for Testing (downloaded by Puppeteer during pnpm install),
# procps for `ps` (the memory sampler reads process-tree RSS via ps on Linux),
# brotli for manual checks of compressed artefact sizes.
RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates fonts-liberation procps brotli \
      libasound2 libatk-bridge2.0-0 libatk1.0-0 libcairo2 libcups2 libdbus-1-3 libdrm2 \
      libexpat1 libgbm1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 \
      libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxdamage1 libxext6 libxfixes3 \
      libxkbcommon0 libxrandr2 xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# pnpm via corepack (version comes from "packageManager" in package.json); cross-env is
# installed globally exactly as in the upstream CI workflow.
RUN npm i -g corepack@latest --force && corepack enable && npm i -g cross-env
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0 \
    GIT_SHA=${GIT_SHA}

# Non-root user `node` (uid 1000) — Chrome refuses to run as root without extra flags,
# and uid 1000 matches the default admin user on the VM, so mounted results stay writable.
USER node
WORKDIR /bench
COPY --chown=node:node . .
RUN pnpm install --frozen-lockfile
# Derived cases (react-*-hub, react-10k-r1…r9) are generated, not committed.
RUN node thesis/patches/gen-cases.mjs

# Chrome inside Docker: no user namespaces for the sandbox and a 64 MB /dev/shm by default.
# A tiny wrapper adds the two standard flags without patching benchmark.ts.
RUN CHROME="$(node -e "import('puppeteer').then(m => console.log(m.default.executablePath()))")" \
 && test -x "$CHROME" \
 && printf '#!/bin/sh\nexec "%s" --no-sandbox --disable-dev-shm-usage "$@"\n' "$CHROME" > /home/node/chrome.sh \
 && chmod +x /home/node/chrome.sh \
 && /home/node/chrome.sh --version
ENV PUPPETEER_EXECUTABLE_PATH=/home/node/chrome.sh

CMD ["pnpm", "benchmark"]
