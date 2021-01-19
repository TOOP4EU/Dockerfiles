#!/bin/bash

version=5.3.2

docker pull tomcat:9-jdk11
docker build --build-arg SMP_VERSION=$version -t toop/phoss-smp:$version .
