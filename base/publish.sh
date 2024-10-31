#!/bin/bash
set -o errexit

VERSION=$(cat VERSION)

buildah push docker.io/antismash/base:latest
buildah push docker.io/antismash/base:${VERSION}
