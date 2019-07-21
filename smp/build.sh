#!/bin/bash

version=5.2.0

docker build --build-arg SMP_VERSION=$version -t toop/peppol-smp-server:$version .
