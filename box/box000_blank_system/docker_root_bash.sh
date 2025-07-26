#!/bin/bash

# Needs environment variables $MOUNT, $TAG, $INIT_FILE (or $INIT_CURL)

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
  echo "Quitting earlier container"
  docker container stop $container_id -t 1
  docker rm $container_id
fi

# if [ ! -z $container_id ]; then
#   docker exec -it --user root $container_id bash $init_file_opt
# else

docker run -d \
-v $MOUNT:/mnt/ \
--user root \
--name $app_name \
lan22h/$app_name:$TAG

container_id=$(get_container_id)

if [ ! -z $container_id ]; then
    if [ ! -z $INIT_CURL ]; then
	curl -sSf $INIT_CURL > $MOUNT/init_curl.tmp.sh
	docker exec -it $container_id bash --init-file /mnt/init_curl.tmp.sh
	container_exit=$?
	rm $MOUNT/init_curl.tmp.sh
    else
	docker exec -it $container_id bash $init_file_opt
	container_exit=$?
    fi
fi

# fi

# User quit the shell, kill the container

container_id=$(get_container_id)

if [ ! -z $container_id ]; then
  echo "Bye!"
  docker container stop $container_id -t 1
  docker rm $container_id
fi

exit $container_exit
