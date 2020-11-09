# docker run -it wfnintr/xsstrike -u <url>
FROM python:alpine
LABEL source="XSStrike <github.com/s0md3v/XSStrike>"
LABEL maintainer="wfnintr@null.net"

RUN apk add --no-cache --virtual .depends git && \
	git clone https://github.com/s0md3v/XSStrike /opt/xsstrike && \
	cd /opt/xsstrike && \
	pip3 install -r requirements.txt && \
	chmod +x xsstrike.py && \
	apk del .depends

WORKDIR /opt/xsstrike
ENTRYPOINT [ "./xsstrike.py" ]
