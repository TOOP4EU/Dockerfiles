#!/bin/bash

echo "************************************************************************"
echo "************************************************************************"
echo "************************************************************************"
echo "***************                                          ***************"
echo "***************        RUNNING phoss SMP ${SMP_VERSION}           ***************" 
echo "***************                                          ***************"            
echo "************************************************************************"            
echo "************************************************************************"            
echo "************************************************************************"


TOOP_DIR=/toop-dir

echo "Create Directories"

#create smp directories
mkdir -p $TOOP_DIR/smp/data
mkdir -p $TOOP_DIR/smp/config

echo "Check SMP Configurations"

#checks for the existence of its $1 parameter in the toop dir
#and creates in if it doesn't exist copying it from default-$1
function checkForConfig {
    echo "Check $1"
    if [ -f $TOOP_DIR/smp/config/$1 ]
    then
        echo "$1 already exists in the $TOOP_DIR/smp/config/$1"
    else
        echo "No $1 file found at $TOOP_DIR/smp/config/ Create a default one"
        cp /supplementaryFiles/default-$1 $TOOP_DIR/smp/config/$1
    fi
}


checkForConfig "pd-client.properties"
checkForConfig "smp-server.properties"
checkForConfig "webapp.properties"
checkForConfig "playground-truststore-v4.1.jks"

echo "RUN TOMCAT"
catalina.sh run

