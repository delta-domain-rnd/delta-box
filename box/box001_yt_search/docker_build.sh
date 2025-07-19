IMAGE=alpine:latest
TAG=latest

app_name="box001_yt_search"

docker build \
  -t lan22h/$app_name:$TAG \
  --build-arg image=$IMAGE \
  .
