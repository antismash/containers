# antiSMASH web server component
# VERSION 0.2.0
FROM alpine:3.6
MAINTAINER Kai Blin <kblin@biosustain.dtu.dk>

RUN apk --no-cache add python3 ca-certificates git gcc musl-dev python3-dev

# Make uids match the old Debian setup
RUN deluser $(getent passwd  | grep ":33:" | cut -d: -f1) && addgroup -S -g 33 www-data && adduser -S -g 33 -u 33 -H www-data

RUN git clone https://github.com/antismash/websmash.git

WORKDIR /websmash

RUN pip3 install -r requirements.txt && \
    pip3 install gunicorn

VOLUME ['/upload', '/config']

ENTRYPOINT ["/usr/bin/gunicorn"]
CMD ["--env", "WEBSMASH_CONFIG=/config/settings.py", "-b", "0.0.0.0:8000", "websmash:app"]
