#!/bin/bash

external_port="8080"

docker build --network="host" --build-arg TC_PORT=$external_port -t toop/peppol-smp-server:5.0.6 .
