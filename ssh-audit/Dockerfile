# Usage:
# docker run -it wfnintr/ssh-audit <target>
FROM python:alpine
LABEL source="ssh-audit <github.com/arthepsy/ssh-audit>"
LABEL maintainer="jsavage <wfnintr@null.net>"

RUN wget https://github.com/arthepsy/ssh-audit/archive/v1.7.0.tar.gz -qO - | tar -C /usr/local/bin/ -xzvf - ssh-audit-1.7.0/ssh-audit.py --strip=1

ENTRYPOINT ["ssh-audit.py"]
