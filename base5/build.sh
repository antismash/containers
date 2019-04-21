#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

docker build -t antismash/base5 .
docker build -t antismash/base5-nonfree -f Dockerfile.nonfree .

docker tag antismash/base5:latest antismash/base5:${VERSION}
docker tag antismash/base5-nonfree:latest antismash/base5-nonfree:${VERSION}
