#!/bin/sh

set -e

install -d -o $NAS_UID -g $NAS_GID -m 770       \
    /tmp/media                                  \
    /tmp/media/downloads

options_file="ytdl-options/options.json"

if [ ! -f "$options_file" ]; then
    install -o $NAS_UID -g $NAS_GID -m 660 ${options_file}.example $options_file
fi
