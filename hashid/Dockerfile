# docker run -it wfnintr/hashid '<hash>'
FROM python:alpine
LABEL source="hashID <github.com/psypanda/hashID>"
LABEL maintainer="wfnintr@null.net"

RUN pip install hashid; pip install --upgrade hashid

ENTRYPOINT [ "hashid" ]
