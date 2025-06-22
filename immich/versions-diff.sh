#!/bin/bash

set -e

OLD_VERSION=$1
NEW_VERSION=$2

if [ ! -n "${OLD_VERSION}" ] || [ ! -n "${NEW_VERSION}" ]; then
    echo "Usage: ./$(basename $0) OLD_VERSION NEW_VERSION"
    exit 1
fi

declare -a FILES=(
    "docker-compose.yml"
    "example.env"
    "hwaccel.ml.yml"
    "hwaccel.transcoding.yml"
)

for file in "${FILES[@]}"; do
    OLD_FILE="https://github.com/immich-app/immich/releases/download/${OLD_VERSION}/${file}"
    NEW_FILE="https://github.com/immich-app/immich/releases/download/${NEW_VERSION}/${file}"

    echo "$file:"
    diff --color=auto <(wget -qO- ${OLD_FILE}) <(wget -qO- ${NEW_FILE}) || true
    echo ""
done
