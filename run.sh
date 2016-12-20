#!/bin/bash
docker rm fted 2> /dev/null

docker run -d -p 9999:8888 -e KERAS_BACKEND=tensorflow --name fted -v `pwd`"/notebook":/notebook ermaker/keras-jupyter
echo "starting up..."
sleep 8
token=`docker logs 2>&1 fted | grep token | cut -d? -f2`
host="localhost"
if [[ ! -z  $DOCKER_HOST ]]; then
  host=`echo $DOCKER_HOST | cut -d: -f2 | cut -d/ -f 3`
fi
echo "running at http://"$host":9999/?"$token
