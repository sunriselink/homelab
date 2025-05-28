#!/bin/bash

set -e

# Remove all init containers (and other containers with exit status 0)
docker rm $(docker ps -qa -f "exited=0")

# Remove all unused networks
docker network prune -f
