# Base image with all non-python OSS dependencies for antiSMASH
# VERSION 9.0.0
FROM debian:trixie
LABEL maintainer="Kai Blin <kblin@dtu.dk>"

# grab all the dependencies
RUN apt-get update && \
    apt-get install -y \
        curl \
        diamond-aligner \
        fasttree \
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
    rm -rf /var/lib/apt/lists/*
