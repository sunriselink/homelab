#!/usr/bin/env bash

set -e

title=$1
body=$2

apprise \
    --title "$title" \
    --body "$body" \
    apprise://apprise:8000/${APPRISE_CONFIG_KEY}?tags=${APPRISE_TAG}
