FROM alpine:latest
MAINTAINER wfnintr <wfnintr@null.net>

# install packages
RUN apk add --no-cache --virtual .build-deps \
	git build-base autoconf \
	&& apk add libressl-dev libsodium-dev \
	&& cd /opt \
	&& git clone https://github.com/ReclaimYourPrivacy/eschalot.git \
	&& cd /opt/eschalot \
	&& make clean && make \
	&& ln -s /opt/eschalot/eschalot /usr/local/bin/v2 \
	&& cd /opt && git clone https://github.com/cathugger/mkp224o.git \
	&& cd mkp224o \
	&& ./autogen.sh \
	&& ./configure --enable-amd64-51-30k \
	&& make \
	&& ln -s /opt/mkp224o/mkp224o /usr/local/bin/v3 \
	&& apk del .build-deps
 
COPY mkonions /usr/local/bin/
RUN chmod +x /usr/local/bin/mkonions
ENTRYPOINT ["mkonions"]


