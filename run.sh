docker run -d -p 9999:8888 -e KERAS_BACKEND=tensorflow -v `pwd`"/notebook":/notebook ermaker/keras-jupyter

echo "running at http://"`echo $DOCKER_HOST | cut -d: -f2 | cut -d/ -f 3`":9999"

