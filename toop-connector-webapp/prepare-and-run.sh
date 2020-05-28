#!/bin/sh

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
mkdir -p ${TC_CONFIG_LOCATION}

echo "Check TC Config"
if [ -f ${TC_CONFIG_FILE} ]
then
    echo "A configuration already exists in the $TOOP_DIR/tc/config/application.properties"
else
    echo "No configuration file found at $TOOP_DIR/tc/config/ Create a default one"
    cp /default-application.properties ${TC_CONFIG_FILE}
fi

echo "delete the existing application.properties file from WEB-INF/classes"
echo "and link ${TC_CONFIG_FILE}"
rm -fr $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/application.properties
cp ${TC_CONFIG_FILE} $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/application.properties

echo "RUN TOMCAT"
catalina.sh run
