#!/bin/sh

script_dir=$(dirname "$(readlink -f "$0")")

get_container_id() {
  docker ps -a --no-trunc --filter name=^/$(cat $script_dir/app_name)$ | sed -n 2p | cut -d' ' -f1
}

container_id=$(get_container_id)

if [ ! -z $container_id ]; then
  docker stop $container_id
  docker rm $container_id
fi
