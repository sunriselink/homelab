#!/usr/bin/env sh

set -e

create-dirs \
    ./data \
    ./cache \
    /tmp/media \
    /tmp/files

render-env ./config.tpl.yaml ./data/config.yaml

wait-for-container \
    traefik \
    authelia
