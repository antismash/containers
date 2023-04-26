# Base image with all non-python OSS dependencies for antiSMASH 6
# VERSION 7.0.0
FROM debian:bullseye
LABEL maintainer="Kai Blin <kblin@biosustain.dtu.dk>"

# set up apt-via-https
RUN apt-get update && apt-get install -y apt-transport-https gnupg ca-certificates && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# set up antiSMASH deb repo
ADD https://dl.secondarymetabolites.org/antismash-bullseye.list /etc/apt/sources.list.d/antismash.list
ADD https://dl.secondarymetabolites.org/antismash.asc /tmp/
RUN apt-key add /tmp/antismash.asc

# grab all the dependencies
RUN apt-get update && \
    apt-get install -y \
        curl \
        diamond-aligner \
        fasttree \
        glimmerhmm \
        hmmer \
        hmmer2 \
        ncbi-blast+ \
        prodigal \
        python3-dev \
        python3-pip \
    && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install -U pip
