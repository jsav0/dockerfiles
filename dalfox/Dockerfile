# github.com/hahwul/dalfox
# docker run -it dalfox 
FROM golang:alpine AS builder
RUN apk add --no-cache git
RUN go get -u -v github.com/hahwul/dalfox

FROM alpine:latest
COPY --from=builder /go/bin/dalfox /usr/local/bin/dalfox
ENTRYPOINT [ "dalfox" ]
