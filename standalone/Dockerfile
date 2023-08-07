# Standalone antiSMASH build
# VERSION 2023080701
ARG ANTISMASH_VERSION
FROM docker.io/antismash/standalone-lite:${ANTISMASH_VERSION}
LABEL maintainer="Kai Blin <kblin@biosustain.dtu.dk>"

# Grab the databases
ADD instance.cfg /usr/local/lib/python3.9/dist-packages/antismash/config/instance.cfg
RUN mkdir -p /local/databases && download-antismash-databases --data /local/databases

VOLUME ["/input", "/output"]
WORKDIR /output

ENTRYPOINT ["/usr/local/bin/run"]
