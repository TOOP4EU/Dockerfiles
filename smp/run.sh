#!/bin/bash

CONTAINER_NAME="smp"

#try to stop and delete the container
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

toop_dir="toop-dir"
external_port="8080"

SMP_VERSION=5.2.0

if (($# != 2 ))
then
    echo "Using defaults:"
else
    toop_dir=$1
    external_port=$2
fi

# check if the toop data dir is relative and convert it to absolute
toop_dir="$(pwd)/$toop_dir"

mkdir -p $toop_dir

echo "CONFIG VOLUME $toop_dir"
echo "PORT          $external_port"

echo "   ./run.sh $toop_dir $external_port"
    
docker network create smpnet

docker run --name $CONTAINER_NAME -d \
     --network smpnet \
     --net-alias $CONTAINER_NAME \
    -v $toop_dir:/toop-dir -p $external_port:8080 \
    toop/phoss-smp:${SMP_VERSION}

