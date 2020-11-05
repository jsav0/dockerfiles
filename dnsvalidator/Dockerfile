# docker run --init -v (pwd):/dnsvalidator/output -it wfnintr/dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 20 -o /dnsvalidator/output/resolvers.txt
FROM python:3.7.3-alpine3.9

LABEL maintainer="dnsvalidator <github.com/vortexau/dnsvalidator>"
LABEL modded.by="wfnintr <github.com/jsav0>"

RUN apk add --no-cache shadow bash && \
    mkdir /dnsvalidator && \
    useradd --create-home --shell /sbin/nologin dnsvalidator

COPY . /dnsvalidator/

WORKDIR /dnsvalidator/

RUN chown -R dnsvalidator:dnsvalidator /dnsvalidator && \
    python3 setup.py install

USER dnsvalidator

ENTRYPOINT ["/usr/local/bin/dnsvalidator"]
