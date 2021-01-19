#!/bin/bash

version=2.1.1
docker push toop/toop-connector:$version
docker tag toop/toop-connector:$version toop/toop-connector:latest
docker push toop/toop-connector:latest
