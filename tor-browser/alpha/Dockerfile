# Usage:
# docker run --log-driver none --rm \
#         -v /dev/shm:/dev/shm \
#         -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#         -e DISPLAY=$DISPLAY \
#         torbrowser
FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y curl gnupg file xz-utils \
	libgtk-3.0 libdbus-glib-1-2 libx11-xcb-dev libxt6

ENV TOR_VERSION="10.0a5" \
	LANG="en-US" \
	FINGERPRINT="EF6E286DDA85EA2A4BA7DE684E2C6E8793298290"

RUN mkdir -p /opt/tor && \
        cd /opt/tor && \
        curl -s https://dist.torproject.org/torbrowser/${TOR_VERSION}/tor-browser-linux64-${TOR_VERSION}_en-US.tar.xz -o torbrowser-alpha.tar.xz && \
        curl -s https://dist.torproject.org/torbrowser/${TOR_VERSION}/tor-browser-linux64-${TOR_VERSION}_en-US.tar.xz.asc -o torbrowser-alpha.tar.xz.asc && \
        gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org && \
        gpg --output ./tor.keyring --export ${FINGERPRINT} && \
        gpgv --keyring ./tor.keyring /opt/tor/torbrowser-alpha.tar.xz.asc /opt/tor/torbrowser-alpha.tar.xz 

RUN cd /opt/tor && tar --strip 1 -xJf torbrowser-alpha.tar.xz tor-browser_${LANG}/Browser

ENV LANG C.UTF-8

RUN useradd anon 
RUN chown -R anon:anon /opt/tor
USER anon

ENTRYPOINT ["/bin/bash"]
CMD ["/opt/tor/Browser/start-tor-browser", "--log", "/dev/stdout" ]
