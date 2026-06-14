#!/usr/bin/env sh

set -e

create-dirs \
    ./grafana/data \
    ./prometheus/data \
    ./alertmanager/data \
    ./alertmanager/config

render-env \
    ./alertmanager/alertmanager.tpl.yml \
    ./alertmanager/config/alertmanager.yml

wait-for-container apprise
