FROM python:3.10-slim-buster

LABEL maintainer="d.slonyara@gmail.com"

RUN apt-get update && apt-get -y --no-install-recommends install \
    gcc \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    ffmpeg

RUN pip3 install pylint \
    black \
    mypy \
    pytest \
    httpx[http2]

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]