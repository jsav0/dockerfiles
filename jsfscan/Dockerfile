#docker run -it -v (pwd):/opt/mnt/:Z jsfscan -l mnt/targets.txt -e -s -m -o mnt/example.com
FROM golang:alpine as builder-go
RUN apk add --no-cache git
RUN GO111MODULE=on go get -u -v github.com/lc/gau
RUN GO111MODULE=on go get -u -v github.com/lc/subjs
RUN GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
RUN GO111MODULE=on go get -v github.com/hakluke/hakrawler

FROM python:alpine
LABEL source="JSFScan.sh <github.com/KathanP19/JSFScan.sh>"
LABEL maintainer="wfnintr@null.net"
WORKDIR /opt
RUN apk add --no-cache shadow bash && \
	useradd --create-home --shell /bin/bash anon

RUN apk update && \
	export PATH="/home/anon/.local/bin:/usr/local/bin/$PATH" && \
        apk add --no-cache --virtual .depends \
        build-base gcc python3-dev git && \
        apk add libxml2-dev libxslt-dev && \
        wget https://raw.githubusercontent.com/m4ll0k/SecretFinder/master/requirements.txt -qO - | pip3 install -r /dev/stdin && \
        wget https://raw.githubusercontent.com/m4ll0k/SecretFinder/master/SecretFinder.py -qO /usr/local/bin/SecretFinder.py && \
        chmod +x /usr/local/bin/SecretFinder.py && \
	git clone https://github.com/codingo/Interlace.git tools/Interlace && \
	pip3 install -r ./tools/Interlace/requirements.txt && \
	cd tools/Interlace && \
	python3 setup.py install && \
	cd - && \
	git clone https://github.com/dark-warlord14/LinkFinder tools/LinkFinder && \
	pip3 install -r ./tools/LinkFinder/requirements.txt && \
	cd tools/LinkFinder && \
	python3 setup.py install && \
	cd - && \
        apk del .depends

RUN wget https://raw.githubusercontent.com/m4ll0k/Bug-Bounty-Toolz/master/jsbeautify.py -qO /opt/tools/jsbeautify.py && \
	wget https://gist.githubusercontent.com/KathanP19/c02130b163ba5817ca2ae99f7630f60f/raw/467cbb5d3773845bfd0e15b2608d6130dd1b6cd7/getjsbeautify.sh -qO /opt/tools/getjsbeautify.sh && \
	wget https://raw.githubusercontent.com/m4ll0k/Bug-Bounty-Toolz/master/getjswords.py -qO /opt/tools/getjswords.py && \
	wget https://gist.githubusercontent.com/KathanP19/d2cda2f99c0b60d64b76ee6039b37e47/raw/eb105a4de06502b2732df9d682c61189c3703685/jsvar.sh -qO /opt/tools/jsvar.sh && \
	wget https://gist.githubusercontent.com/KathanP19/9c1a8a322ada7b40462caf6897687cce/raw/3752435180c61ce7af13865b6b3581b49a6c6673/findomxss.sh -qO /opt/tools/findomxss.sh

COPY --from=builder-go /go/bin/* /usr/local/bin/

RUN wget -q https://raw.githubusercontent.com/KathanP19/JSFScan.sh/master/JSFScan.sh && \
	chmod +x JSFScan.sh

RUN export PATH="/home/anon/.local/bin:/usr/local/bin/$PATH" && \
	chown -R anon:anon /opt
USER anon
ENTRYPOINT [ "./JSFScan.sh" ]

