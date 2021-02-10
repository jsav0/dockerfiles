# docker run -it dalfox 
FROM golang:alpine AS builder
RUN apk add --no-cache git
RUN go get -u github.com/hahwul/dalfox

FROM alpine:latest
LABEL source="dalfox <github.com/hahwul/dalfox>"
LABEL maintainer="jsavage <wfnintr@null.net>"
COPY --from=builder /go/bin/dalfox /usr/local/bin/dalfox
ENTRYPOINT [ "dalfox" ]
