#!/usr/bin/env sh

set -e

create-dirs ./data

wait-for-container admin-docker-socket
