# https://hub.docker.com/_/nextcloud/tags
FROM nextcloud:31.0.5

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*
