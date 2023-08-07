#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

for img in antismash/webservice:latest antismash/webservice:${VERSION}; do
    buildah push docker.io/$img
done
