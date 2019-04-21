#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

for img in antismash/standalone-lite:latest antismash/standalone-lite:${VERSION} antismash/standalone-lite-nonfree:latest antismash/standalone-lite-nonfree:${VERSION}; do
    docker push $img
done
