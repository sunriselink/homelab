#!/bin/sh

set -e

create-dirs                 \
    ./grafana/data          \
    ./prometheus/data       \
    ./alertmanager/data     \
    ./alertmanager/config

render-env ./alertmanager/alertmanager.yml ./alertmanager/config/alertmanager.yml
