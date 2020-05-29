#!/bin/bash

version=2.0.0-beta4

docker pull tomcat:9-jre11
docker build --build-arg TOOP_CONNECTOR_VERSION=$version -t toop/tc-webapp:$version .
docker build --build-arg TOOP_CONNECTOR_VERSION=$version -t toop/tc-webapp:latest .
