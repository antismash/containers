#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

docker build -t antismash/webservice .

docker tag antismash/webservice:latest antismash/webservice:${VERSION}
