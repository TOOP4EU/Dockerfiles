#!/bin/sh

TOOP_DIR=/toop-dir

echo "************************************************************************"
echo "************************************************************************"
echo "************************************************************************"
echo "***************                                          ***************"
echo "***************      RUNNING TOOP Connector ${TOOP_CONNECTOR_VERSION}        ***************" 
echo "***************                                          ***************"            
echo "************************************************************************"            
echo "************************************************************************"            
echo "************************************************************************"

echo "Create Directories"

#create connector directories
mkdir -p $TOOP_DIR/tc/dumps/from-dc
mkdir -p $TOOP_DIR/tc/dumps/to-dc
mkdir -p $TOOP_DIR/tc/dumps/from-dp
mkdir -p $TOOP_DIR/tc/dumps/to-dp
mkdir -p $TOOP_DIR/tc/config


echo "Check TC Config"
if [ -f $TOOP_DIR/tc/config/toop-connector.properties ]
then
    echo "A configuration already exists in the $TOOP_DIR/tc/config/toop-connector.properties"
else
    echo "No configuration file found at $TOOP_DIR/tc/config/ Create a default one"
    cp /supplementaryFiles/default-toop-connector.properties $TOOP_DIR/tc/config/toop-connector.properties
fi

echo "RUN TOMCAT"
catalina.sh run
