#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

buildah build --build-arg "ANTISMASH_VERSION=${VERSION}" -t docker.io/antismash/standalone .

buildah tag docker.io/antismash/standalone:latest docker.io/antismash/standalone:${VERSION}

for f in *.tmpl; do
    OUTFILE="${f/\.tmpl/}"
    sed -e "s/@@VERSION@@/${VERSION}/" $f > ${OUTFILE}
    chmod a+x ${OUTFILE}
done
