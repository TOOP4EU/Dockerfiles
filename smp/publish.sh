#!/bin/bash

version=5.3.2

docker login
docker push toop/phoss-smp:$version
docker tag toop/phoss-smp:$version toop/phoss-smp:latest
docker push toop/phoss-smp:latest
docker logout
