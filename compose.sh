#!/bin/bash

set -e

stack_path=${1%/}
compose_args=${*:2}
compose_opts="--env-file global.env"

if [[ -z "$stack_path" || -z "$compose_args" ]]; then
  echo "Usage: ./$(basename $0) <stack_path> <docker_compose_args>"
  exit 1
fi

if [[ -f "$stack_path/.env" ]]; then
  compose_opts="$compose_opts --env-file $stack_path/.env"
fi

set -x
docker compose $compose_opts -f $stack_path/docker-compose.yml $compose_args
