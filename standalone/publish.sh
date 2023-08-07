#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

for img in antismash/standalone:latest antismash/standalone:${VERSION} antismash/standalone-nonfree:latest antismash/standalone-nonfree:${VERSION}; do
    buildah push docker.io/$img
done
