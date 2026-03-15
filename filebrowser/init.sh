#!/bin/sh

set -e

create-dirs         \
    ./data          \
    ./cache         \
    /tmp/media      \
    /tmp/files

cat ./config.yaml | envsubst > ./data/config.yaml
