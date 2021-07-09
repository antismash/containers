#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

for img in antismash/webservice:latest antismash/webservice:${VERSION}; do
    docker push $img
done
