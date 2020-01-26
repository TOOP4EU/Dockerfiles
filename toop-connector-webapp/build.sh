#!/bin/bash

version=0.10.8

docker pull tomcat:9-jre11
docker build --build-arg TOOP_CONNECTOR_VERSION=$version -t toop/toop-connector-webapp:$version .
