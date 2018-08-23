FROM arm32v7/ubuntu

RUN apt-get update
RUN apt-get install -y \
    git \
    gcc \
    make \
    automake \
    libgmp-dev \
    libcurl4-openssl-dev

ARG workdir=/tmp
WORKDIR $workdir
RUN git clone https://github.com/m-pays/m-cpuminer-v2.git
WORKDIR $workdir/m-cpuminer-v2
RUN ./autogen.sh && ./configure CFLAGS="-O3" CXXFLAGS="-O3"
RUN make && make install
RUN rm -rf $workdir/m-cpuminer-v2

CMD ["m-minerd","--benchmark"]
