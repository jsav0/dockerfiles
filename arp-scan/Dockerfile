# Basic Usage:
# docker run --net=host -it wfnintr/arp-scan -l
FROM alpine:latest
LABEL maintainer="wfnintr@null.net"
RUN apk add --no-cache --virtual .depends \
	git automake autoconf make gcc g++ libpcap-dev && \
	apk add libpcap && \
	git clone https://github.com/royhills/arp-scan.git && \
	cd arp-scan && \
	autoreconf --install && \
	./configure && \
	make && \
	make install && \
	apk del .depends
ENTRYPOINT ["arp-scan"]
