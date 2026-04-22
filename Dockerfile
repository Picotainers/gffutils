# syntax=docker/dockerfile:1

FROM python:3.11-slim-bookworm AS builder

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
    && rm -rf /var/lib/apt/lists/*

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

WORKDIR /src
RUN git clone --depth 1 https://github.com/daler/gffutils.git gffutils

RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir /src/gffutils

FROM python:3.11-slim-bookworm

ENV PATH="/opt/venv/bin:${PATH}"
COPY --from=builder /opt/venv /opt/venv

RUN printf '#!/usr/bin/env sh\nexec gffutils-cli "$@"\n' > /usr/local/bin/gffutils \
    && chmod +x /usr/local/bin/gffutils

WORKDIR /data
ENTRYPOINT ["gffutils"]
