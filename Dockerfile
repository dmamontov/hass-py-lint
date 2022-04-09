FROM python:3.10-slim-buster

LABEL maintainer="d.slonyara@gmail.com"

RUN apt-get update && apt-get -y --no-install-recommends install \
    gcc \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev

RUN pip3 install pylint \
    black \
    mypy

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]