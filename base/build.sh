#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

docker build -t antismash/base .
docker build -t antismash/base-nonfree -f Dockerfile.nonfree .

docker tag antismash/base:latest antismash/base:${VERSION}
docker tag antismash/base-nonfree:latest antismash/base-nonfree:${VERSION}
