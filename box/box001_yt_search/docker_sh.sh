#!/bin/sh

# Needs to be hardcoded to run from web
app_name="box001_yt_search"

TAG=latest

get_container_id() {
  docker ps -a --no-trunc --filter name=^/$app_name$ | sed -n 2p | cut -d' ' -f1
}

container_id=$(get_container_id)

if [ ! -z $container_id ]; then
  docker exec -it $container_id sh
else
    docker run -d \
      -v $MOUNT:/mnt/ \
      --user $(id -u):$(id -g) \
      --name $app_name \
      lan22h/$app_name:$TAG
    
    container_id=$(get_container_id)
    
    if [ ! -z $container_id ]; then
      docker exec -it $container_id sh
    fi
fi

