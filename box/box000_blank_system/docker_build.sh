docker build \
  -t lan22h/$(cat app_name):$TAG \
  --build-arg image=$IMAGE \
  .
