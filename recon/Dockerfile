# docker run -it recon
FROM golang:alpine AS builder
RUN apk add --no-cache git build-base
LABEL maintainer="wfnintr@null.net <github.com/jsav0>"

# subfinder
RUN GO111MODULE=on go get -u github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# httpx
RUN GO111MODULE=on go get -u github.com/projectdiscovery/httpx/cmd/httpx

# dnsx
RUN GO111MODULE=on go get -u  github.com/projectdiscovery/dnsx/cmd/dnsx

# gau
RUN GO111MODULE=on go get -u github.com/lc/gau

# gospider
RUN go get -u github.com/jaeles-project/gospider

# hakrawler
RUN go get -u github.com/hakluke/hakrawler

# gf
RUN go get -u github.com/tomnomnom/gf && \
  cp -r $GOPATH/src/github.com/tomnomnom/gf/examples /tmp/gf && \
  git clone https://github.com/1ndianl33t/Gf-Patterns && mv Gf-Patterns/*.json /tmp/gf && \
  git clone https://github.com/dwisiswant0/gf-secrets && mv gf-secrets/.gf/* /tmp/gf

# qsreplace
RUN go get -u github.com/tomnomnom/qsreplace

# fff
RUN go get -u github.com/tomnomnom/fff


# dalfox
RUN go get -u github.com/hahwul/dalfox

# assetfinder
RUN go get -u github.com/tomnomnom/assetfinder

# findomain
RUN wget https://github.com/Findomain/Findomain/releases/download/2.1.4/findomain-linux -qO /usr/local/bin/findomain && chmod +x /usr/local/bin/findomain

# massdns
RUN git clone https://github.com/blechschmidt/massdns massdns && \ 
	cd massdns && make && cp bin/massdns /usr/local/bin/ && cd -

# shuffledns
RUN GO111MODULE=on go get -u github.com/projectdiscovery/shuffledns/cmd/shuffledns


# final image
FROM alpine:latest
RUN apk add --no-cache jq curl bash grep
COPY --from=builder /go/bin/* /usr/local/bin/
COPY --from=builder /usr/local/bin/* /usr/local/bin/
RUN mkdir /recon && mkdir ~/.gf
WORKDIR /recon
COPY --from=builder /tmp/gf/* /root/.gf/
COPY resolvers.txt .
COPY run.sh .

ENTRYPOINT ["/bin/sh"]


