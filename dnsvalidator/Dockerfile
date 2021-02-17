# usage:
# docker run -v $(pwd):/dnsvalidator/output -t dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 20 -o /dnsvalidator/output/resolvers.txt
FROM python:alpine
LABEL source="dnsvalidator <github.com/vortexau/dnsvalidator>"
LABEL maintainer="jsavage <wfnintr@null.net>"

RUN apk add --no-cache --virtual .deps git && \
	git clone https://github.com/vortexau/dnsvalidator && \
	cd dnsvalidator && \
	python3 setup.py install && \
	cd .. && rm -rf dnsvalidator && \
	apk del .deps

ENTRYPOINT ["dnsvalidator"]
