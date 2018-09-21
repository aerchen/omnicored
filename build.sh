#!/bin/bash
if [ -n "$1" ]; then
    tag=$1
else
    tag='latest'
fi

if [ -n "$2" ]; then
    repo_url=$2
else
    repo_url='registry.quachain.net:5000'
fi

containerName=omni
echo $containerName
imageName="${repo_url}/${containerName}:${tag}" #$(git rev-parse --short HEAD)
echo $imageName
docker build -t $imageName -f Dockerfile . && docker push $imageName

