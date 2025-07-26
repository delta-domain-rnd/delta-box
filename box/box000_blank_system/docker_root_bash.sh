#!/bin/sh

# Needs environment variables $MOUNT, $TAG, $INIT_FILE

# Needs to be hardcoded to run from web
app_name="box000_blank_system"


if [ -z $INIT_FILE ]; then
  init_file_opt=""
else
  init_file_opt="--init-file /mnt/$INIT_FILE"
fi

get_container_id() {
  docker ps -a --no-trunc --filter name=^/$app_name$ | sed -n 2p | cut -d' ' -f1
}

container_id=$(get_container_id)

if [ ! -z $container_id ]; then
  docker exec -it --user root $container_id bash $init_file_opt
else
    docker run -d \
      -v $MOUNT:/mnt/ \
      --user root \
      --name $app_name \
      lan22h/$app_name:$TAG
    
    container_id=$(get_container_id)
    
    if [ ! -z $container_id ]; then
      docker exec -it $container_id bash $init_file_opt
    fi
fi


# User quit the shell, kill the container

container_id=$(get_container_id)

if [ ! -z $container_id ]; then
  echo "Bye!"
  docker container stop $container_id -t 1
  docker rm $container_id
fi
