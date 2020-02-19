#!/bin/bash

version=5.2.3

docker login
docker push toop/phoss-smp:$version
docker tag toop/phoss-smp:$version toop/phoss-smp:latest
docker push toop/phoss-smp:latest
docker logout
