# docker run -it wfnintr/arjun -u <url> --get
FROM python:alpine
LABEL source="Arjun <github.com/s0md3v/Arjun>"
LABEL maintainer="wfnintr@null.net"

RUN apk add --no-cache git && \
	pip3 install requests

RUN git clone https://github.com/s0md3v/Arjun /opt/arjun && \
	chmod +x /opt/arjun/arjun.py

WORKDIR /opt/arjun
ENTRYPOINT [ "./arjun.py" ]
