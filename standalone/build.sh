#!/bin/bash
set -o errexit

VERSION="4.2.0"

docker build -t antismash/standalone .
docker build -t antismash/standalone-nonfree -f Dockerfile.nonfree .

docker tag antismash/standalone:latest antismash/standalone:${VERSION}
docker tag antismash/standalone-nonfree:latest antismash/standalone-nonfree:${VERSION}
