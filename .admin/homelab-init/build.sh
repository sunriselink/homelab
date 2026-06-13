#!/usr/bin/env bash

set -e

tag=localhost/homelab-init:v2
cwd=$(dirname $0)

docker build --force-rm --pull --tag $tag $cwd
