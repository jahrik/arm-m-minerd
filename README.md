# arm-m-minerd

[![Build](https://github.com/jahrik/arm-m-minerd/actions/workflows/build.yml/badge.svg)](https://github.com/jahrik/arm-m-minerd/actions/workflows/build.yml)

Multi-arch [m-cpuminer-v2](https://github.com/m-pays/m-cpuminer-v2) (Magi/XMG CPU miner) image for spare cycles on the Pi swarm cluster. Multi-stage build from source on Ubuntu.

## Run

```bash
docker run -d -e M_USER=user -e M_WORK=worker -e M_PASS=pass \
  -e M_URL=stratum+tcp://xmg.minerclaim.net:3333 -e M_CPU=50 \
  jahrik/arm-m-minerd:latest
```

## Deploy (swarm)

```bash
./update_labels.sh   # label which nodes mine
just deploy          # global service on miner=true nodes, stack: mine
```

## Build

```bash
just build
just push
```

CI: PR builds + `--version` check; merge to main pushes multi-arch (amd64/arm64/armv7) to Docker Hub.
