#!/usr/bin/env bash

set -e

title=$1
body=$2

data=$(jq -n --arg title "$title" --arg body "$body" '{title: $title, body: $body}')

curl -X POST \
    -d "$data" \
    -H 'Content-Type: application/json' \
    http://apprise:8000/notify/${APPRISE_CONFIG_KEY}?tags=${APPRISE_TAG}
