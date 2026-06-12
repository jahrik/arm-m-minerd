FROM docker.io/library/ubuntu:24.04 AS build

ENV DEBIAN_FRONTEND=noninteractive
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates gcc g++ make automake autoconf libtool \
    libgmp-dev libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN git clone --depth 1 https://github.com/m-pays/m-cpuminer-v2.git
WORKDIR /tmp/m-cpuminer-v2
RUN ./autogen.sh && ./configure CFLAGS="-O3" CXXFLAGS="-O3" \
    && make && make install

FROM docker.io/library/ubuntu:24.04

LABEL org.opencontainers.image.authors="jahrik@gmail.com"

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgmp10 libcurl4t64 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local/bin/m-minerd /usr/local/bin/m-minerd

ENV M_USER=m_user
ENV M_WORK=m_work
ENV M_PASS=m_pass
ENV M_URL=stratum+tcp://xmg.minerclaim.net:3333
ENV M_CPU=50

CMD ["sh", "-c", "m-minerd --url $M_URL -u $M_USER.$M_WORK -p $M_PASS -e $M_CPU"]
