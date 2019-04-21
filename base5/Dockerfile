# Base image with all non-python OSS dependencies for antiSMASH 5
# VERSION 0.1.0
FROM debian:stretch
LABEL maintainer="Kai Blin <kblin@biosustain.dtu.dk>"

# set up apt-via-https
RUN apt-get update && apt-get install -y apt-transport-https gnupg && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# set up antiSMASH deb repo
ADD https://dl.secondarymetabolites.org/antismash-stretch.list /etc/apt/sources.list.d/antismash.list
ADD https://dl.secondarymetabolites.org/antismash.asc /tmp/
RUN apt-key add /tmp/antismash.asc

# grab all the dependencies
RUN apt-get update && \
    apt-get install -y \
        clustalw \
        curl \
        default-jre-headless \
        diamond-aligner \
        fasttree \
        glimmerhmm \
        hmmer \
        hmmer2 \
        hmmer2-compat \
        muscle \
        ncbi-blast+ \
        prodigal \
        python3-dev \
        python3-pip \
    && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
