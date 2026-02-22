#!/bin/bash

set -e

stack_path=${1%/}
compose_args=${*:2}
env_options="--env-file global.env"

if [[ -z "$stack_path" || -z "$compose_args" ]]; then
  echo "Usage: ./$(basename $0) <stack_path> <docker_compose_args>"
  exit 1
fi

if [[ -f "$stack_path/.env" ]]; then
  env_options="$env_options --env-file $stack_path/.env"
fi

set -x

docker compose $env_options -f $stack_path/docker-compose.yml $compose_args
