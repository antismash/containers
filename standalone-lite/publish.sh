#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

for img in antismash/standalone-lite:latest antismash/standalone-lite:${VERSION}; do
    buildah push docker.io/$img
done
