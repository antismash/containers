# Debian package builder with FPM
# VERSION 0.1.0
FROM debian:jessie
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

# set up antiSMASH deb repo
ADD http://dl.secondarymetabolites.org/antismash.list /etc/apt/sources.list.d/antismash.list
ADD http://dl.secondarymetabolites.org/antismash.asc /tmp/
RUN apt-key add /tmp/antismash.asc


RUN apt-get update && apt-get install -y ruby ruby-dev gcc make python-dev python-setuptools
RUN gem install fpm

VOLUME ['/outside']
WORKDIR /outside
