#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

buildah build --build-arg "ANTISMASH_VERSION=${VERSION}" -t docker.io/antismash/standalone .
buildah build --build-arg "ANTISMASH_VERSION=${VERSION}" -t docker.io/antismash/standalone-nonfree -f Dockerfile.nonfree .

buildah tag docker.io/antismash/standalone:latest docker.io/antismash/standalone:${VERSION}
buildah tag docker.io/antismash/standalone-nonfree:latest docker.io/antismash/standalone-nonfree:${VERSION}
