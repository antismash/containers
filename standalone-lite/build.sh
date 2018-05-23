#!/bin/bash
set -o errexit

VERSION="4.1.0"

docker build -t antismash/standalone-lite .
docker build -t antismash/standalone-lite-nonfree -f Dockerfile.nonfree .

docker tag antismash/standalone-lite:latest antismash/standalone-lite:${VERSION}
docker tag antismash/standalone-lite-nonfree:latest antismash/standalone-lite-nonfree:${VERSION}
