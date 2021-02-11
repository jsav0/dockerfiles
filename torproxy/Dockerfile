# Usage:
# docker run -d -p 127.0.0.1:9050:9050 --name torproxy wfnintr/torproxy
FROM alpine:latest
LABEL maintainer="wfnintr@null.net"

RUN apk add --no-cache libcap tor
RUN chown tor /etc/tor
RUN setcap cap_net_bind_service=+ep /usr/bin/tor

EXPOSE 9050

COPY torproxy /usr/local/bin/
RUN chmod +x /usr/local/bin/torproxy

USER tor
CMD ["torproxy"]
