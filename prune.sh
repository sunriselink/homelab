#!/bin/bash

set -e

# Remove all init containers (and other containers with exit status 0)
containers=$(docker ps -qa -f "exited=0")

if [ -n "$containers" ]; then
  docker rm $containers
else
  echo "No stopped containers with exit status 0"
fi

# Remove all unused networks
docker network prune -f

# Remove all dangling images
docker image prune -f
