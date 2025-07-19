#!/bin/sh


app_name="box001_yt_search"

# Mount points for development.
export MOUNT_POINT=$HOME/data/mounted/$app_name/

if [ "$(cat is_persistent)" = "Yes" ]; then
  docker run -it -d \
    -v $MOUNT_POINT:/mnt/ \
    --user $(id -u):$(id -g) \
    --name $app_name \
    lan22h/$app_name:latest
else
  # Action on "No"
  docker run --rm -it \
    -v $MOUNT_POINT:/mnt/ \
    --user $(id -u):$(id -g) \
    --name $app_name \
    lan22h/$app_name:latest \
    $@
fi
