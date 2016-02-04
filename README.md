antiSMASH files for Docker
==========================

This repository contains a number of Dockerfiles to build different antiSMASH
containers. Missing from all these containers is the EC prediction code, because
there currently is no EC predictor that I can ship freely.

Standalone
----------

This is a standalone antiSMASH build that contains the CLI application, and all
the required dependencies. As this container also ships the ClusterBlast and
PFAM database, it is rather large, but you don't need to worry about needing to
download anything but this container.

Standalone lite
----------------

Similar to the standalone container, but requires the ClusterBlast and PFAM
databases to be provided as a volume as a trade-off for a smaller image size.


Runsmash lite
-------------

The antiSMASH job runner that powers the [official antiSMASH website](http://antismash.secondarymetabolites.org).
This does include the antiSMASH CLI app with all required dependencies. Note
that like the standalone-lite image, the ClusterBlast and PFAM databases are
not included. Like for the standalone images, no EC predictor is included either.


Debian FPM
----------

Small image to build .deb files for the other images using [FPM](https://github.com/jordansissel/fpm).
