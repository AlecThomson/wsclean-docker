#!/bin/bash
for i in $(ls Dockerfile-*); do
    ./build_one.sh $i
done
