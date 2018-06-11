#!/bin/bash

#download and install SMP

cd /
echo "Downloading phoss SMP from $SMP_URL"
wget $SMP_URL -O smp.zip 
unzip smp.zip -d /smpsetup/ 
cp -r /smpsetup/ $CATALINA_HOME/webapps/ROOT
rm -fr smpsetup smp.zip

