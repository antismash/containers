antiSMASH files for Docker
==========================

This repository contains a number of Dockerfiles to build different antiSMASH
containers. Missing from all these containers is the EC prediction code, because
there currently is no EC predictor that I can ship freely.

Base
----

Base image with all the antiSMASH dependencies installed

Testenv
-------

Base image plus development dependencies to run the continuous integration tests.

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


Websmash
--------

The web UI componnent of the [official antiSMASH website](http://antismash.secondarymetabolites.org).
Configuration defaults can be easily changed using an external settings file.

antismash
---------

A version of the standalone antiSMASH build without the wrapper magic. Use this
to run from workflow management tools like [Common Workflow Language (CWL)](http://www.commonwl.org/).


Debian FPM
----------

Small image to build .deb files for the other images using [FPM](https://github.com/jordansissel/fpm).
