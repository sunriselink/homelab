#!/usr/bin/env bash

set -e

title=$1
body=$2

curl -X POST \
    -F "title=$title" \
    -F "body=$body" \
    -F "tags=${APPRISE_TAG}" \
    http://apprise:8000/notify/${APPRISE_CONFIG_KEY}
