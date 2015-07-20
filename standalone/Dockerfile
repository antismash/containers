# Standalone antiSMASH build
# VERSION 0.0.2
FROM debian:jessie
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

ENV ANTISMASH_URL="https://bitbucket.org/antismash/antismash/downloads"
ENV ANTISMASH_VERSION="3.0.3"

# set up antiSMASH deb repo
ADD http://dl.secondarymetabolites.org/antismash.list /etc/apt/sources.list.d/antismash.list
ADD http://dl.secondarymetabolites.org/antismash.asc /tmp/
RUN apt-key add /tmp/antismash.asc

# grab all the dependencies
RUN apt-get update && apt-get install -y sudo ncbi-blast+ glimmerhmm tigr-glimmer diamond hmmer2 hmmer hmmer2-compat muscle prodigal fasttree default-jre-headless python-straight.plugin python-pysvg python-helperlibs python-biopython python-pyquery python-backports.lzma

# Grab antiSMASH
ADD ${ANTISMASH_URL}/antismash-${ANTISMASH_VERSION}.tar.gz /tmp/
RUN tar xf /tmp/antismash-${ANTISMASH_VERSION}.tar.gz

# Grab the databases
WORKDIR antismash-${ANTISMASH_VERSION}
RUN python download_databases.py

ADD instance.cfg antismash/config/instance.cfg

ADD run /usr/local/bin/run

WORKDIR /usr/local/bin
RUN ln -s /antismash-${ANTISMASH_VERSION}/run_antismash.py

VOLUME ["/input", "/output"]
WORKDIR /output

ENTRYPOINT ["/usr/local/bin/run"]
