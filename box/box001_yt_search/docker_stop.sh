#!/bin/sh

# Needs to be hardcoded to run from web
app_name="box001_yt_search"

get_container_id() {
  docker ps -a --no-trunc --filter name=^/$app_name$ | sed -n 2p | cut -d' ' -f1
}

container_id=$(get_container_id)

if [ ! -z $container_id ]; then
  docker container stop $container_id -t 1
  docker rm $container_id
fi
