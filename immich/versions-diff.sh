#!/bin/bash

set -e

old_version=$1
new_version=$2

if [[ -z "${old_version}" || -z "${new_version}" ]]; then
    echo "Usage: ./$(basename $0) <old_version> <new_version>"
    exit 1
fi

declare -a files=(
    "docker-compose.yml"
    "example.env"
    "hwaccel.ml.yml"
    "hwaccel.transcoding.yml"
)

for file in "${files[@]}"; do
    old_file="https://github.com/immich-app/immich/releases/download/${old_version}/${file}"
    new_file="https://github.com/immich-app/immich/releases/download/${new_version}/${file}"

    echo "$file:"
    diff --color=auto <(wget -qO- ${old_file}) <(wget -qO- ${new_file}) || true
    echo ""
done
