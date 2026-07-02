#!/usr/bin/env bash

old_version=$1
new_version=$2

if [[ -z "${old_version}" || -z "${new_version}" ]]; then
    echo "Usage: ./$(basename $0) <old_version> <new_version>"
    exit 1
fi

declare -a files=(
    "docker-compose.rootless.yml"
    "example.env"
    "hwaccel.ml.yml"
    "hwaccel.transcoding.yml"
)

download_file() {
    local version=$1
    local file=$2
    local url="https://github.com/immich-app/immich/releases/download/${version}/${file}"

    wget -qO- "$url" || {
        echo "Failed to download ${url}" >&2
        return 1
    }
}

for file in "${files[@]}"; do
    echo "$file:"

    old_content=$(download_file "${old_version}" "${file}") || exit $?
    new_content=$(download_file "${new_version}" "${file}") || exit $?

    diff --color=auto \
        <(printf '%s' "$old_content") \
        <(printf '%s' "$new_content") \
        && echo "No changes" \
        || true

    echo
done
