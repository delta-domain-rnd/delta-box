#!/bin/sh

script_dir=$(dirname "$(readlink -f "$0")")

# Mount points for development.
export MOUNT_POINT=$HOME/data/mounted/$(cat $script_dir/app_name)/

get_container_id() {
  docker ps -a --no-trunc --filter name=^/$(cat $script_dir/app_name)$ | sed -n 2p | cut -d' ' -f1
}

container_id=$(get_container_id)

if [ ! -z $container_id ]; then
  docker exec -it $container_id sh
else
    docker run -it -d \
      -v $MOUNT_POINT:/mnt/ \
      --user $(id -u):$(id -g) \
      --name $(cat $script_dir/app_name) \
      lan22h/$(cat $script_dir/app_name):$TAG
    
    container_id=$(get_container_id)
    
    if [ ! -z $container_id ]; then
      docker exec -it $container_id sh
    fi
fi

