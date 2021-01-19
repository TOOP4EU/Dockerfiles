#!/bin/bash

version=2.1.1

docker pull tomcat:9-jdk11
docker build --build-arg TOOP_CONNECTOR_VERSION=$version -t toop/tc-webapp:$version .
docker build --build-arg TOOP_CONNECTOR_VERSION=$version -t toop/tc-webapp:latest .
