#!/bin/bash

CONTAINER=$(buildah from docker.io/library/debian:12)
MOUNT=$(buildah mount "$CONTAINER")

cp diamond "$MOUNT"/usr/bin

buildah run "$CONTAINER" -- sh -c 'apt update && apt install -y ncbi-blast+ && apt clean -y && apt autoclean -y && apt autoremove -y && rm -rf /var/lib/apt/lists/*'
buildah commit "$CONTAINER" docker.io/antismash/asdb-jobs:latest
