# AGENTS.md

Multi-arch Magi (XMG) CPU miner: multi-stage source build of m-pays/m-cpuminer-v2 on Ubuntu, deployed as the `mine` swarm stack on nodes labeled `miner=true`.

## Commands

```bash
just build                                  # build jahrik/arm-m-minerd:latest
docker run --rm jahrik/arm-m-minerd:latest m-minerd --version
just deploy                                 # swarm stack deploy (stack: mine)
```

## CI

`build.yml`: Test (build + `--version`) on PR; Release (buildx amd64/arm64/armv7 push to Docker Hub) on merge to main. Needs `DOCKERHUB_USERNAME`/`DOCKERHUB_TOKEN` secrets.

## Quirks

- Upstream has no releases — the build clones master at image build time.
- Runtime stage needs `libgmp10` + `libcurl4t64` (Ubuntu 24.04's curl package name).
- Pool credentials come from `M_*` env vars; placement is gated on the `miner=true` node label (`update_labels.sh`).
