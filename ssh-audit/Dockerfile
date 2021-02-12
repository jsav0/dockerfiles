# Usage:
# server audit: docker run -it wfnintr/ssh-audit <target>
# client audit: docker run -it -p 2222:2222 wfnintr/ssh-audit -c
FROM python:alpine
LABEL source="ssh-audit (new) <github.com/jtesta/ssh-audit>"
LABEL maintainer="jsavage <wfnintr@null.net"

WORKDIR /opt
RUN apk add --no-cache --virtual .deps git && \
	git clone https://github.com/jtesta/ssh-audit && \
	ln -s /opt/ssh-audit/ssh-audit.py /usr/local/bin/ && \
	apk del .deps

ENTRYPOINT ["ssh-audit.py"]
