#!/bin/bash
for distro in buster bionic focal; do
    docker build -t kblin/${distro}-fpm -f Dockerfile.${distro} .
done
