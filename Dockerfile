FROM arm32v7/ubuntu

ENV M_USER=m_user
ENV M_WORK=m_work
ENV M_PASS=m_pass
ENV M_URL=stratum+tcp://xmg.minerclaim.net:3333
ENV M_CPU=50

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

CMD m-minerd --url $M_URL -u $M_USER.$M_WORK -p $M_PASS -e $M_CPU
