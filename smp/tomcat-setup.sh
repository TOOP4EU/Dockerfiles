#!/bin/bash

echo "Catalina Home: $CATALINA_HOME"

#download and install tomcat
mkdir $CATALINA_HOME
cd $CATALINA_HOME
wget $TOMCAT_URL -O tomcat.tar.gz
tar -xvzf tomcat.tar.gz -C . --strip-components 1
rm -fr tomcat.tar.gz

cd $CATALINA_HOME/webapps
#remove default apps
rm -r ROOT
rm -r docs
rm -r examples
