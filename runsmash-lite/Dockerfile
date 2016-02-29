# Standalone antiSMASH runner without databases or EFICAz
# VERSION 0.0.1
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
        git \
        glimmerhmm \
        hmmer \
        hmmer2 \
        hmmer2-compat \
        libc6-i386 \
        muscle \
        ncbi-blast+ \
        prodigal \
        python-backports.lzma \
        python-biopython \
        python-cobra \
        python-excelerator \
        python-glpk \
        python-helperlibs \
        python-hiredis \
        python-libsbml \
        python-pyinotify \
        python-pyquery \
        python-pysvg \
        python-redis \
        python-requests \
        python-statsd \
        python-straight.plugin \
        python-subprocess32 \
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


ADD instance.cfg /antismash-${ANTISMASH_VERSION}/antismash/config/instance.cfg

# grab runSMASH
RUN git clone https://bitbucket.org/antismash/runsmash.git

# compress the shipped profiles
WORKDIR /antismash-${ANTISMASH_VERSION}/antismash/specific_modules/nrpspks
RUN hmmpress abmotifs.hmm && hmmpress dockingdomains.hmm && hmmpress ksdomains.hmm && hmmpress nrpspksdomains.hmm
WORKDIR /antismash-${ANTISMASH_VERSION}/antismash/generic_modules/smcogs/
RUN hmmpress smcogs.hmm

WORKDIR /usr/local/bin
RUN ln -s /antismash-${ANTISMASH_VERSION}/run_antismash.py
RUN ln -s /eficaz/bin/eficaz2.5
ADD entrypoint.sh /entrypoint.sh

VOLUME ["/upload", "/databases", "/eficaz"]
WORKDIR /runsmash
