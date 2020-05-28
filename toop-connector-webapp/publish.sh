#!/bin/bash

version=2.0.0-beta4

docker push toop/toop-connector-webapp:$version
docker tag toop/toop-connector-webapp:$version toop/toop-connector-webapp:latest
docker push toop/toop-connector-webapp:latest

