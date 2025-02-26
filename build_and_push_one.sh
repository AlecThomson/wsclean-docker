#!/bin/bash

dockerfile=$1

# check if the dockerfile exists
if [ ! -f $dockerfile ]; then
    echo "'$dockerfile' does not exist"
    exit 1
fi

# get tag from dockerfile name
# if just Dockerfile, tag is "latest"
tag=${dockerfile#Dockerfile-}
if [ "$tag" == "Dockerfile" ]; then
    tag="latest"
fi

echo "Building $dockerfile with tag $tag"

docker build \
    --platform linux/amd64 \
    -t alecthomson/wslcean:$tag \
    . \
    -f $dockerfile \
    --push