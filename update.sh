#!/bin/bash

set -e

stack_path=$1

if [[ -z "$stack_path" ]]; then
  echo "Usage: ./$(basename $0) <stack_path>"
  exit 1
fi

./compose.sh $stack_path up -d --pull always --build --force-recreate --remove-orphans
