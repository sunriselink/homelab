# https://hub.docker.com/_/nextcloud/tags
# https://nextcloud.com/changelog/
FROM nextcloud:31.0.8

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*
