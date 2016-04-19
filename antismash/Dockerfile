# Standalone antiSMASH build for CWL
# VERSION 0.0.4
FROM debian:jessie
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

ENV ANTISMASH_URL="https://bitbucket.org/antismash/antismash/downloads"
ENV ANTISMASH_VERSION="3.0.5"

# set up antiSMASH deb repo
ADD http://dl.secondarymetabolites.org/antismash.list /etc/apt/sources.list.d/antismash.list
ADD http://dl.secondarymetabolites.org/antismash.asc /tmp/
RUN apt-key add /tmp/antismash.asc

# grab all the dependencies
RUN apt-get update && \
    apt-get install -y \
        curl \
        default-jre-headless \
        diamond \
        fasttree \
        glimmerhmm \
        hmmer \
        hmmer2 \
        hmmer2-compat \
        muscle \
        ncbi-blast+ \
        prodigal \
        python-backports.lzma \
        python-biopython \
        python-excelerator \
        python-helperlibs \
        python-pyquery \
        python-pysvg \
        python-straight.plugin \
        tigr-glimmer \
    && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Grab antiSMASH
RUN curl -L ${ANTISMASH_URL}/antismash-${ANTISMASH_VERSION}.tar.gz > /tmp/antismash-${ANTISMASH_VERSION}.tar.gz && \
    tar xf /tmp/antismash-${ANTISMASH_VERSION}.tar.gz && \
    rm /tmp/antismash-${ANTISMASH_VERSION}.tar.gz

# Grab the databases
WORKDIR antismash-${ANTISMASH_VERSION}
RUN python download_databases.py

ADD instance.cfg antismash/config/instance.cfg

WORKDIR /usr/local/bin
RUN ln -s /antismash-${ANTISMASH_VERSION}/run_antismash.py
