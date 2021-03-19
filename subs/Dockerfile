# passive subdomain enumeration
# usage: 
# docker run -v $(pwd):/opt/subs/results -it wfnintr/subs <target.com>
FROM golang:alpine AS builder

RUN apk add --no-cache git build-base
ENV GO111MODULE=on

# subfinder
RUN go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# assetfinder
RUN go get github.com/tomnomnom/assetfinder

# findomain
RUN wget https://github.com/Findomain/Findomain/releases/download/2.1.4/findomain-linux -qO /usr/local/bin/findomain && chmod +x /usr/local/bin/findomain

# amass
RUN go get -v github.com/OWASP/Amass/v3/...

# massdns
RUN git clone https://github.com/blechschmidt/massdns massdns && \ 
	cd massdns && make && cp bin/massdns /usr/local/bin/ && cd -

# shuffledns
RUN go get github.com/projectdiscovery/shuffledns/cmd/shuffledns


FROM alpine:latest
LABEL maintainer="jsavage <wfnintr@null.net>"
RUN apk add --no-cache jq curl bash grep

COPY --from=builder /go/bin/* /usr/local/bin/
COPY --from=builder /usr/local/bin/* /usr/local/bin/

RUN mkdir /opt/subs 
WORKDIR /opt/subs

COPY subs .

ENTRYPOINT ["/opt/subs/subs"]
