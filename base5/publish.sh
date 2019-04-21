#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

for img in antismash/base5:latest antismash/base5:${VERSION} antismash/base5-nonfree:latest antismash/base5-nonfree:${VERSION}; do
    docker push $img
done
