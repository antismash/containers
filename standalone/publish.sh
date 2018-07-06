#!/bin/bash
set -o errexit

VERSION="4.2.0"

for img in antismash/standalone:latest antismash/standalone:${VERSION} antismash/standalone-nonfree:latest antismash/standalone-nonfree:${VERSION}; do
    docker push $img
done
