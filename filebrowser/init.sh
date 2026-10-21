#!/usr/bin/env sh

set -e

create-dirs \
    ./data \
    ./cache \
    /tmp/media \
    /tmp/files

wait-for-container \
    traefik \
    authelia
