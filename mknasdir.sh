#!/bin/bash

set -e

NAS_USER=${NAS_USER:-nas}
NAS_GROUP=$(id -g $NAS_USER)

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

if [ "$#" -eq 0 ]; then
  echo "Illegal number of parameters"
  exit 2
fi

for path in "$@"
do
  if [ ! -e "$path" ]; then
    mkdir $path
    chown $NAS_USER:$NAS_GROUP $path
    chmod g+w $path
    echo "$path: created"
  elif [ -d "$path" ]; then
    echo "$path: directory exists"
  else
    echo "$path: exists and is not a directory"
    exit 3
  fi
done
