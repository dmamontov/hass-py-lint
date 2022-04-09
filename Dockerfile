FROM python:3.10-alpine3.15

LABEL maintainer="d.slonyara@gmail.com"

RUN apk add --no-cache \
    gcc

RUN pip3 install pylint \
    black \
    mypy

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]