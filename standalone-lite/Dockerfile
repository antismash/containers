# Standalone antiSMASH build without databases
# VERSION 0.0.4
FROM antismash/base:4.0.0
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

ENV ANTISMASH_URL="https://dl.secondarymetabolites.org/releases/"
ENV ANTISMASH_VERSION="4.0.0"

# Grab antiSMASH
RUN curl -L ${ANTISMASH_URL}/${ANTISMASH_VERSION}/antismash-${ANTISMASH_VERSION}.tar.gz > /tmp/antismash-${ANTISMASH_VERSION}.tar.gz && \
    tar xf /tmp/antismash-${ANTISMASH_VERSION}.tar.gz && \
    rm /tmp/antismash-${ANTISMASH_VERSION}.tar.gz

ADD instance.cfg /antismash-${ANTISMASH_VERSION}/antismash/config/instance.cfg

# Create the shared bgc_seeds.hmm file
RUN /antismash-${ANTISMASH_VERSION}/scripts/create_bgc_seeds.sh /antismash-${ANTISMASH_VERSION}

# compress the shipped profiles
RUN hmmpress /antismash-${ANTISMASH_VERSION}/antismash/specific_modules/nrpspks/abmotifs.hmm && \
    hmmpress /antismash-${ANTISMASH_VERSION}/antismash/specific_modules/nrpspks/dockingdomains.hmm && \
    hmmpress /antismash-${ANTISMASH_VERSION}/antismash/specific_modules/nrpspks/ksdomains.hmm && \
    hmmpress /antismash-${ANTISMASH_VERSION}/antismash/specific_modules/nrpspks/nrpspksdomains.hmm && \
    hmmpress /antismash-${ANTISMASH_VERSION}/antismash/specific_modules/nrpspks/sandpuma/flat/fullset0_smiles/fullset0_smiles_nrpsA.hmmdb && \
    hmmpress /antismash-${ANTISMASH_VERSION}/antismash/generic_modules/smcogs/smcogs.hmm && \
    hmmpress /antismash-${ANTISMASH_VERSION}/antismash/generic_modules/active_site_finder/hmm/p450.hmm3 && \
    hmmpress /antismash-${ANTISMASH_VERSION}/antismash/generic_modules/hmm_detection/bgc_seeds.hmm
ADD run /usr/local/bin/run

WORKDIR /usr/local/bin
RUN ln -s /antismash-${ANTISMASH_VERSION}/run_antismash.py

VOLUME ["/input", "/output", "/databases"]
WORKDIR /output

ENTRYPOINT ["/usr/local/bin/run"]
