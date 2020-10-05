from alpine:latest
label maintainer="wfnintr@null.net"

run apk add --no-cache libcap tor
run chown tor /etc/tor
run setcap cap_net_bind_service=+ep /usr/bin/tor
expose 9050
copy torproxy /usr/local/bin/
run chmod +x /usr/local/bin/torproxy
user tor
cmd ["torproxy"]
