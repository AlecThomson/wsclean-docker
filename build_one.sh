#!/bin/bash

dockerfile=$1

# check if the dockerfile exists
if [ ! -f $dockerfile ]; then
    echo "'$dockerfile' does not exist"
    exit 1
fi

docker build \
    --progress=plain \
    --platform linux/amd64 \
    -t alecthomson/wsclean:v${dockerfile#Dockerfile-} \
    . \
    -f $dockerfile