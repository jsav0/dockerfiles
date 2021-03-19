# Usage: 
# docker run -v $(pwd)/test/:/tmp/minica -it wfnintr/minica --domains foo.com
FROM golang:alpine as builder
LABEL source="minica <github.com/jsha/minica>"
LABEL maintainer="jsavage <wfnintr@null.net>"
RUN go get github.com/jsha/minica

FROM alpine
COPY --from=builder /go/bin/minica /usr/local/bin/
RUN adduser -D CA
USER CA
WORKDIR /tmp/minica
ENTRYPOINT ["minica"]
