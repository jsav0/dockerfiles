# Usage: 
# docker run -it --rm -h iperf3 -p 5201:5201 iperf3
FROM alpine:latest
LABEL maintainer "wfnintr@null.net"

RUN apk add --no-cache iperf3
USER nobody
EXPOSE 5201/tcp

ENTRYPOINT ["/usr/bin/iperf3", "-s"]
