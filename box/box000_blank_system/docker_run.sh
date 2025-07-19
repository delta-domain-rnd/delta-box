#!/bin/sh

# Mount points for development.
export MOUNT_POINT=$HOME/data/mounted/$(cat app_name)/

if [ "$(cat is_persistent)" = "Yes" ]; then
  docker run -it -d \
    -v $MOUNT_POINT:/mnt/ \
    --user $(id -u):$(id -g) \
    --name $(cat app_name) \
    lan22h/$(cat app_name):latest
else
  # Action on "No"
  docker run --rm -it \
    -v $MOUNT_POINT:/mnt/ \
    --user $(id -u):$(id -g) \
    --name $(cat app_name) \
    lan22h/$(cat app_name):latest \
    $@
fi

#  -p $SSH_PORT:22 \
