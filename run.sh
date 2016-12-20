#!/bin/bash
#docker run -d -p 9999:8888 -e KERAS_BACKEND=tensorflow --name fted -v `pwd`"/notebook":/notebook ermaker/keras-jupyter

token=`docker logs 2>&1 fted | grep token | cut -d? -f2`
host="localhost"
if [[ ! -z  $DOCKER_HOST ]]; then
  host=`echo $DOCKER_HOST | cut -d: -f2 | cut -d/ -f 3`
fi
echo "running at http://"$host":9999/?"$token
