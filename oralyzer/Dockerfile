#docker run -it wfnintr/oralyzer -u http://example.com --wayback
FROM golang:alpine as gobuilder
RUN apk add --no-cache git
RUN go get github.com/tomnomnom/waybackurls


FROM python:alpine
LABEL source="Oralyzer <github.com/r0075h3ll/Oralyzer>"
LABEL maintainer="wfnintr@null.net"

COPY --from=gobuilder /go/bin/waybackurls /usr/local/bin/

WORKDIR /opt
RUN apk add --no-cache --virtual .depends git && \
	git clone https://github.com/r0075h3ll/Oralyzer && \
	pip3 install -r ./Oralyzer/requirements.txt && \
	apk del .depends

RUN addgroup -S anon && adduser -S anon -G anon && \
	chown -R anon:anon /opt
USER anon
WORKDIR /opt/Oralyzer
ENTRYPOINT [ "./oralyzer.py" ]

