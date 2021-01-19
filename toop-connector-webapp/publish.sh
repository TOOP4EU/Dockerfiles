#!/bin/bash

version=2.1.1

docker push toop/toop-connector-webapp:$version
docker tag toop/toop-connector-webapp:$version toop/toop-connector-webapp:latest
docker push toop/toop-connector-webapp:latest

