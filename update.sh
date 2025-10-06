#!/bin/bash

set -e

if [ "$#" -lt 1 ]; then
  echo "Illegal number of parameters"
  exit 1
fi

./compose.sh $1 up -d --pull always --force-recreate --build
