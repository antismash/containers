# Standalone plantiSMASH runner without databases
# VERSION 0.0.1
FROM debian:jessie
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

RUN apt-get update && apt-get install -y apt-transport-https && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# set up antiSMASH deb repo
ADD http://dl.secondarymetabolites.org/antismash.list /etc/apt/sources.list.d/antismash.list
ADD http://dl.secondarymetabolites.org/antismash.asc /tmp/
RUN apt-key add /tmp/antismash.asc


# grab all the dependencies
RUN apt-get update && \
    apt-get install -y \
        cd-hit \
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
        liblzma-dev \
        libxml2-dev \
        libxslt-dev \
        muscle \
        ncbi-blast+ \
        prodigal \
        python-dev \
        python-hiredis \
        python-pip \
        python-pyinotify \
        python-redis \
        python-requests \
        python-subprocess32 \
        tigr-glimmer \
        zlib1g-dev \
    && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Grab plantiSMASH
RUN git clone https://bitbucket.org/satriaphd/plantismash-release /plantismash

ADD instance.cfg /plantismash/antismash/config/instance.cfg
RUN cd /plantismash && pip install -r requirements.txt

# grab runSMASH
RUN git clone https://bitbucket.org/antismash/runsmash.git

# compress the shipped profiles
WORKDIR /plantismash/antismash/specific_modules/nrpspks
RUN hmmpress abmotifs.hmm && hmmpress dockingdomains.hmm && hmmpress ksdomains.hmm && hmmpress nrpspksdomains.hmm
WORKDIR /plantismash/antismash/generic_modules/smcogs/
RUN hmmpress smcogs.hmm

WORKDIR /usr/local/bin
RUN ln -s /plantismash/run_antismash.py && ln -s /usr/bin/cdhit cd-hit
ADD entrypoint.sh /entrypoint.sh

VOLUME ["/upload", "/databases"]
WORKDIR /runsmash
