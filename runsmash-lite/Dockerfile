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
RUN apt-get update && apt-get install -y ncbi-blast+ glimmerhmm tigr-glimmer diamond hmmer2 hmmer hmmer2-compat muscle prodigal fasttree default-jre-headless python-straight.plugin python-pysvg python-helperlibs python-biopython python-pyquery python-backports.lzma python-glpk python-cobra python-pyinotify python-redis python-hiredis python-requests python-subprocess32 python-statsd git libc6-i386 python-libsbml

# grab antiSMASH
ADD ${ANTISMASH_URL}/antismash-${ANTISMASH_VERSION}.tar.gz /tmp/
RUN tar xf /tmp/antismash-${ANTISMASH_VERSION}.tar.gz
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

VOLUME ["/upload", "/databases", "/eficaz"]
WORKDIR /runsmash
