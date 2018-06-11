#!/bin/bash

JDK_DOCKER_VOLUME=jdk_volume
export JDK_DOCKER_VOLUME

CONTAINER_NAME="smp"

#try to stop and delete the container
docker stop $CONTAINER_NAME

docker rm $CONTAINER_NAME

toop_dir="toop-dir"
external_port="8080"

SMP_VERSION=5.0.6

if (($# != 2 ))
then
    echo "Using defaults:"
else
    toop_dir_volume=$1
    external_port=$2
fi


# check if the toop data dir is relative and convert it to absolute
if [[ $toop_dir == /* ]]
then
   echo "$toop_dir is absolute path"
else
   echo "$toop_dir is relative, convert it to absolute"
   toop_dir="$(pwd)/$toop_dir"
fi

mkdir -p $toop_dir

echo "CONFIG VOLUME $toop_dir"
echo "PORT          $external_port"

echo "   ./run.sh jdk_volume $toop_dir $external_port"
    
#docker run --name peppol-smp-server -d -v $JDK_:/jdk_home -v $toop_dir:/toop-dir -p $external_port:$external_port toop/peppol-smp-server:5.0.6

docker network create smpnet

docker run --name $CONTAINER_NAME -d \
     --network smpnet \
     --net-alias $CONTAINER_NAME \
    -v $JDK_DOCKER_VOLUME:/jdk_home \
    -v $toop_dir:/toop-dir -p $external_port:8080 \
    toop/peppol-smp-server:${SMP_VERSION}