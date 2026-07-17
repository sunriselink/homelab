#!/usr/bin/env bash

set -e

cwd=$(dirname "$(realpath "$0")")
compose_file="$cwd/docker-compose.yml"

image=$(grep -oE 'ghcr\.io/authelia/authelia:[^[:space:]"]+' "$compose_file" | head -n1)

if [[ -z "$image" ]]; then
    echo "Error: image ghcr.io/authelia/authelia not found in docker-compose.yml"
    exit 1
fi

docker run -it --rm $image authelia "$@"
