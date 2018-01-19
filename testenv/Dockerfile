# Container with the test environment for antiSMASH
# VERSION 0.0.3
FROM antismash/base-nonfree:4.1.0
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

RUN pip install nose minimock
