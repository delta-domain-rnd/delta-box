app_name="box000_blank_system"

if [ "$(cat is_persistent)" = "Yes" ]; then
  docker kill $app_name || echo '' > /dev/null
  docker rm $app_name
fi

docker rmi lan22h/$app_name:latest || \
echo 'Nothing to clean!'
