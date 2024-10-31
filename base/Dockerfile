# Base image with all non-python OSS dependencies for antiSMASH 8
# VERSION 8.0.0
FROM debian:bookworm
LABEL maintainer="Kai Blin <kblin@biosustain.dtu.dk>"

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
