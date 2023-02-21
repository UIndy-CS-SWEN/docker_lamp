#!/bin/sh

CUR_DIR=$(pwd)

#clean up the apache2 server log files
rm ${CUR_DIR}/logs/apache2/*.log

#stop all the running docker containers and then remove all of them
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

#remove the image called "python" and "flask"
docker image rm $(docker images 'web-server-webserver' -a -q | head -n 1)
docker image rm $(docker images 'web-server-nodejs' -a -q | head -n 1)
docker image rm $(docker images 'mysql' -a -q | head -n 1)
docker image rm $(docker images 'mongo' -a -q | head -n 1)

#build images and containers
docker compose up -d
