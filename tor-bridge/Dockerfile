FROM voidlinux/voidlinux-musl:latest
MAINTAINER wfnintr <unrelated@example.com>

# install packages
RUN xbps-install -Suy bash libcap-progs tor obfs4proxy

# create unprivileged user
RUN groupadd -g 9001 tord && useradd -u 9001 -g tord tord

# setup torrc 
COPY torrc /etc/tor/torrc
RUN chown -R tord:tord /etc/tor/torrc
RUN chmod 0700 /etc/tor/torrc

# logging/runtime
RUN chmod o+rw /var/log
RUN chown -R tord:tord /var/lib/tor

# custom scripts
COPY get-bridge-ident /usr/local/bin
RUN chmod 0755 /usr/local/bin/get-bridge-ident

# Allow obfs4proxy to bind to ports < 1024.
RUN setcap cap_net_bind_service=+ep /bin/obfs4proxy

# Open ORPort obfs4proxyPort ControlPort
EXPOSE 9001 443 9051

# start
USER tord
CMD ["tor", "-f", "/etc/tor/torrc"]
