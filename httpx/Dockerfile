FROM golang:1.14-alpine AS builder
RUN apk add --no-cache git
RUN GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx

FROM alpine:latest
LABEL source="httpx <github.com/projectdiscovery/httpx>"
LABEL maintainer="jsavage <wfnintr@null.net>"
COPY --from=builder /go/bin/httpx /usr/local/bin/

ENTRYPOINT ["httpx"]

