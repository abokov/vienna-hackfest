#! /bin/bash

if [ -z "$1" ]
  then
    echo "Error: expected ./docker-deploy.sh yourname/app"
fi"
fi

my_image="$1"
docker ps | grep $my_image | awk '{print $1}' | xargs docker stop
docker pull $my_image
docker run -d $my_image
