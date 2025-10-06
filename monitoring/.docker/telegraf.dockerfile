# https://hub.docker.com/_/telegraf/tags
# https://github.com/influxdata/telegraf/releases
FROM telegraf:1.36.2

RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo smartmontools && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee /etc/sudoers.d/telegraf
