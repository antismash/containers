#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

buildah build --build-arg "ANTISMASH_VERSION=${VERSION}" -t docker.io/antismash/webservice .
buildah tag docker.io/antismash/webservice:latest docker.io/antismash/webservice:${VERSION}
