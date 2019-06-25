#!/bin/bash

version=5.1.2

docker build --build-arg SMP_VERSION=$version -t toop/peppol-smp-server:$version .
