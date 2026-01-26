# https://hub.docker.com/_/nextcloud/tags
# https://nextcloud.com/changelog/
FROM nextcloud:32.0.5

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*
