# Base image with all dependencies for antiSMASH installed
# VERSION 0.1.0
FROM debian:jessie
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

# set up apt-via-https
RUN apt-get update && apt-get install -y apt-transport-https && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# set up antiSMASH deb repo
ADD https://dl.secondarymetabolites.org/antismash.list /etc/apt/sources.list.d/antismash.list
ADD https://dl.secondarymetabolites.org/antismash.asc /tmp/
RUN apt-key add /tmp/antismash.asc

# grab all the dependencies
RUN apt-get update && \
    apt-get install -y \
        clustalw \
        curl \
        default-jre-headless \
        diamond \
        fasttree \
        glimmerhmm \
        hmmer \
        hmmer2 \
        hmmer2-compat \
        mafft \
        meme-suite \
        muscle \
        ncbi-blast+ \
        prodigal \
        python-backports.lzma \
        python-bcbio-gff \
        python-ete2 \
        python-excelerator \
        python-biopython \
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
