app_name="box000_blank_system"

docker build \
  -t lan22h/$app_name:$TAG \
  --build-arg image=$IMAGE \
  .
