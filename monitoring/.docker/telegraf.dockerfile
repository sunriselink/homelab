# https://hub.docker.com/_/telegraf/tags
FROM telegraf:1.34.4

RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo smartmontools && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee /etc/sudoers.d/telegraf
