#!/bin/bash

docker rm $(docker ps -qa -f "exited=0")
