# Standalone antiSMASH build
# VERSION 2021070901
FROM antismash/standalone-lite:6.0.1
LABEL maintainer="Kai Blin <kblin@biosustain.dtu.dk>"

# Grab the databases
ADD instance.cfg /usr/local/lib/python3.7/dist-packages/antismash/config/instance.cfg
RUN mkdir -p /local/databases && download-antismash-databases --data /local/databases

VOLUME ["/input", "/output"]
WORKDIR /output

ENTRYPOINT ["/usr/local/bin/run"]
