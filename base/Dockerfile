# Base image with all OSS dependencies for antiSMASH installed
# VERSION 0.2.0
FROM debian:stretch
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

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
        mafft \
        muscle \
        ncbi-blast+ \
        prodigal \
        python-backports.lzma \
        python-bcbio-gff \
        python-ete2 \
        python-excelerator \
        python-biopython \
        python-biopython-sql \
        python-helperlibs \
        python-matplotlib \
        python-networkx \
        python-pandas \
        python-pip \
        python-pyquery \
        python-pysvg \
        python-scipy \
        python-sklearn \
        tigr-glimmer \
    && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
