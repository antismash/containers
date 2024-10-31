#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

buildah build -t docker.io/antismash/base .

buildah tag docker.io/antismash/base:latest docker.io/antismash/base:${VERSION}
