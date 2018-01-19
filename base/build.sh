#!/bin/bash

docker build -t antismash/base .
docker build -t antismash/base-nonfree -f Dockerfile.nonfree .
