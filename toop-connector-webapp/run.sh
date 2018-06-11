JDK_DOCKER_VOLUME="jdk_volume"
toop_dir="toop-dir"
external_port="8081"


if [ "$#" -ne 2 ]
then
    echo "Using defaults:"
else
    toop_dir_volume=$1
    external_port=$2
fi


CONTAINER_NAME="toop-connector"

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME


# check if the toop data dir is relative and convert it to absolute
if [[ $toop_dir == /* ]]
then
   echo "$toop_dir is absolute path"
else
   echo "$toop_dir is relative, convert it to absolute"
   toop_dir="$(pwd)/$toop_dir"
fi

mkdir -p $toop_dir

echo "JDK VOLUME    $jdk_volume"
echo "CONFIG VOLUME $toop_dir"
echo "PORT          $external_port"

echo "   ./run.sh $jdk_volume $toop_dir $external_port"
    
    
docker run --name $CONTAINER_NAME \
           --network elonia \
           --net-alias $CONTAINER_NAME \
           --link smp \                             
           -d -v $JDK_DOCKER_VOLUME:/jdk_home \
           -v $toop_dir:/toop-dir \
           -p $external_port:8080 \
           toop/toop-connector-webapp:0.9.1

docker network connect smpnet toop-connector
