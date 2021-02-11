# Usage:
# docker run -it wfnintr/arjun -u <url> 
# https://github.com/s0md3v/Arjun/wiki/Usage
FROM python:alpine
LABEL source="Arjun <github.com/s0md3v/Arjun>"
LABEL maintainer="wfnintr@null.net"

RUN apk add --no-cache git && \
	pip3 install requests

RUN git clone https://github.com/s0md3v/Arjun /opt/Arjun && \
	cd /opt/Arjun && python setup.py install

ENTRYPOINT [ "arjun" ]
