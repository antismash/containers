# Container with the test environment for antiSMASH
# VERSION 0.0.3
FROM antismash/base5-nonfree:5.0.0rc1
LABEL maintainer="Kai Blin <kblin@biosustain.dtu.dk>"

ENV ANTISMASH_VERSION="test"

# grab all the dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
    && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install nose minimock
