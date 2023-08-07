#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

buildah build --build-arg "ANTISMASH_VERSION=${VERSION}" -t docker.io/antismash/standalone-lite .
buildah build --build-arg "ANTISMASH_VERSION=${VERSION}" -t docker.io/antismash/standalone-lite-nonfree -f Dockerfile.nonfree .

buildah tag docker.io/antismash/standalone-lite:latest docker.io/antismash/standalone-lite:${VERSION}
buildah tag docker.io/antismash/standalone-lite-nonfree:latest docker.io/antismash/standalone-lite-nonfree:${VERSION}
