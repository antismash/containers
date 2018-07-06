#!/bin/bash
for distro in stretch jessie; do
    docker build -t kblin/${distro}-fpm -f Dockerfile.${distro} .
done
