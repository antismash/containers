#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

for img in antismash/base:latest antismash/base:${VERSION} antismash/base-nonfree:latest antismash/base-nonfree:${VERSION}; do
    docker push $img
done
