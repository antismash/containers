# Standalone antiSMASH build without databases
# VERSION 2023111501
ARG ANTISMASH_BASE_VERSION=latest
FROM docker.io/antismash/base:${ANTISMASH_BASE_VERSION}
LABEL maintainer="Kai Blin <kblin@biosustain.dtu.dk>"

ARG ANTISMASH_VERSION
ENV ANTISMASH_URL="https://dl.secondarymetabolites.org/releases/"

ENV LANG C.UTF-8

# Grab antiSMASH
RUN curl -L ${ANTISMASH_URL}/${ANTISMASH_VERSION}/antismash-${ANTISMASH_VERSION}.tar.gz > /tmp/antismash-${ANTISMASH_VERSION}.tar.gz && \
    tar xf /tmp/antismash-${ANTISMASH_VERSION}.tar.gz && \
    rm /tmp/antismash-${ANTISMASH_VERSION}.tar.gz

ADD instance.cfg /antismash-${ANTISMASH_VERSION}/antismash/config/instance.cfg


RUN pip3 install /antismash-${ANTISMASH_VERSION} --break-system-packages && python3 -c "import antismash; antismash.config.build_config(['--databases', 'mounted_at_runtime'], modules=antismash.get_all_modules()); antismash.main.prepare_module_data()"

WORKDIR /usr/local/bin
RUN ln -s /antismash-${ANTISMASH_VERSION}/docker/run

RUN mkdir /matplotlib && MPLCONFIGDIR=/matplotlib python3 -c "import matplotlib.pyplot as plt" && chmod -R a+rw /matplotlib

VOLUME ["/input", "/output", "/databases"]
WORKDIR /output

ENTRYPOINT ["/usr/local/bin/run"]
