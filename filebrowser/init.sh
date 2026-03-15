#!/bin/sh

set -e

create-dirs         \
    ./data          \
    ./cache         \
    /tmp/media      \
    /tmp/files

render-env ./config.yaml ./data/config.yaml
