FROM debian:latest

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install -y \
        build-essential \
        samtools \
        python3 \
        python3-pip \
        git \
    && apt clean

RUN pip3 install \
    numpy \
    scipy \
    future \
    pysam \
    networkx

RUN cd ~ \
    && git clone https://github.com/aakashsur/docker-hirise.git \
    && chmod u+x ~/docker-hirise/hirise.sh \
    && chmod u+x ~/docker-hirise/scripts/* \
    && ln -s ~/docker-hirise/scripts/* /usr/local/bin/ \
    && ln -s ~/docker-hirise/hirise.sh /usr/local/bin/hirise 

