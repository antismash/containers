# antiSMASH web server component
# VERSION 0.1.0
FROM debian:jessie
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

RUN apt-get update && apt-get install -y \
    git \
    python-pip

RUN git clone https://github.com/antismash/websmash.git

WORKDIR /websmash

RUN pip install -r requirements.txt && \
    pip install gunicorn

VOLUME ['/upload', '/config']

ENTRYPOINT ["/usr/local/bin/gunicorn"]
CMD ["--env", "WEBSMASH_CONFIG=/config/settings.py", "-b", "0.0.0.0:8000", "websmash:app"]
