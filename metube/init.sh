#!/bin/sh

set -e

create-dirs \
    ./config \
    /tmp/media \
    /tmp/media/downloads

presets_file="config/presets.json"

if [ ! -f "$presets_file" ]; then
    echo "{}" > $presets_file
    chown ${NAS_UID?}:${NAS_GID:?} $presets_file
    chmod 660 $presets_file
fi
