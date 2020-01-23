#!/bin/bash

version=0.10.7

docker login --username
docker push toop/toop-connector-webapp:$version
docker tag toop/toop-connector-webapp:$version toop/toop-connector-webapp:latest
docker push toop/toop-connector-webapp:latest
docker logout
