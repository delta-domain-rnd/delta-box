script_dir=$(dirname "$(readlink -f "$0")")

docker push lan22h/$(cat $script_dir/app_name):$TAG
#echo lan22h/$(cat $script_dir/app_name):$TAG
