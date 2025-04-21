#!/bin/bash

set -e

if [ "$#" -lt 2 ]; then
  echo "Illegal number of parameters"
  exit 1
fi

COMPOSE_APP=$1
COMPOSE_COMMANDS=${*:2}
COMPOSE_OPTS="--env-file global.env"

if [ -f "$COMPOSE_APP/.env" ]; then
  COMPOSE_OPTS="$COMPOSE_OPTS --env-file $COMPOSE_APP/.env"
fi

set -x
docker compose $COMPOSE_OPTS -f $COMPOSE_APP/docker-compose.yml $COMPOSE_COMMANDS
