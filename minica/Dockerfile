# Usage: 
# docker run -v $(pwd):/CA -it wfnintr/minica --domains foo.com
FROM golang:alpine as builder
RUN printf "CA:x:1000:1000:Certificate Authority,,,:/CA:/bin/sh\n" > /tmp/passwd
RUN apk add --no-cache git && \
	git clone https://github.com/jsha/minica.git /go/src/minica && \
	cd /go/src/minica && \
	CGO_ENABLED=0 go build -o /go/bin/minica


FROM scratch
LABEL source="minica <github.com/jsha/minica>"
LABEL maintainer="jsavage <wfnintr@null.net>"
COPY --from=builder /go/bin/minica /bin/minica
COPY --from=builder /tmp/passwd /etc/passwd
USER CA
WORKDIR /CA
ENTRYPOINT ["/bin/minica"]
