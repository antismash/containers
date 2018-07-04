#!/bin/bash
set -o errexit

docker build -t antismash/base .
docker build -t antismash/base-nonfree -f Dockerfile.nonfree .
