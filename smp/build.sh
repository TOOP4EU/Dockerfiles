#!/bin/bash

version=5.2.1

docker pull tomcat:9-jre11
docker build --build-arg SMP_VERSION=$version -t toop/phoss-smp:$version .
