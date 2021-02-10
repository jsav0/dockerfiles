FROM golang:1.15-alpine3.12 AS build-env
RUN GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx

FROM alpine:3.12
LABEL source="httpx <github.com/projectdiscovery/dnsx>"
LABEL maintainer="jsavage <wfnintr@null.net>"
COPY --from=build-env /go/bin/dnsx /usr/local/bin/dnsx
ENTRYPOINT ["dnsx"]
