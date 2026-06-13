#!/usr/bin/env sh

set -e

render-env ./traefik.tpl.yml ./config/traefik.yml

wait-for-container \
    readonly-docker-socket \
    authelia \
    crowdsec
