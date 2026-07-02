#!/usr/bin/env bash

set -e

config_key="apprise"
tag="alerts"
title=""
body=""

while [[ $# -gt 0 ]]; do
    case "$1" in
    --config)
        config_key="$2"
        shift 2
        ;;
    --title)
        title="$2"
        shift 2
        ;;
    --body)
        body="$2"
        shift 2
        ;;
    --tag)
        tag="$2"
        shift 2
        ;;
    *)
        echo "Unknown argument: $1"
        exit 1
        ;;
    esac
done

if [[ -z "$body" ]]; then
    echo "Error: --body is required"
    exit 1
fi

docker exec apprise apprise \
    --config /config/$config_key.yml \
    --plugin-path /plugin \
    --tag "$tag" \
    --title "$title" \
    --body "$body"
