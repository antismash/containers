#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

for img in antismash/standalone:latest antismash/standalone:${VERSION}; do
    buildah push docker.io/$img
done
