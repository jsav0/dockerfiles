FROM golang:alpine as builder
RUN apk add git build-base && \
	git clone https://github.com/blechschmidt/massdns && cd massdns && make
RUN GO111MODULE=on go get -v github.com/projectdiscovery/shuffledns/cmd/shuffledns

FROM alpine:latest
LABEL source="massdns <github.com/blechschmidt/massdns>"
LABEL maintainer="jsavage <wfnintr@null.net>"
COPY --from=builder /go/massdns/bin/massdns /usr/local/bin/
COPY --from=builder /go/bin/shuffledns /usr/local/bin/

ENTRYPOINT ["shuffledns"]
