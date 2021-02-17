# docker run -v $HOME/.config/subfinder:/root/.config/subfinder -it wfnintr/subfinder -d <target.com>
FROM golang:1.14-alpine AS build-env
LABEL source="subfinder <github.com/projectdiscovery/subfinder>"
LABEL maintainer="jsavage <wfnintr@null.net>"
RUN GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

FROM alpine:latest
COPY --from=build-env /go/bin/subfinder /usr/local/bin/
ENTRYPOINT ["subfinder"]
