# Basic usage:
# docker run --rm -it wfnintr/knockpy domain.com
FROM python:2.7-alpine
LABEL maintainer="wfnintr@null.net"
RUN apk add --no-cache --virtual .depends git && \
	pip install dnspython && \
	git clone https://github.com/guelfoweb/knock.git && \
	cd knock && \
	python setup.py install \
	&& apk del .depends
ENTRYPOINT ["knockpy"]
