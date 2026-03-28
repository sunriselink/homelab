#!/bin/bash

set -e

tag=localhost/homelab-init:v1
cwd=$(dirname $0)

docker build \
    --file $cwd/Dockerfile \
    --force-rm \
    --pull \
    --tag $tag \
    $cwd
