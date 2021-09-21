#!/bin/bash

set -x
statuscheck "environment to be ready..."
cd /root/lab/ && clear
echo "Starting movies-api-java..."
set +x
cd dd-continuous-profiler-example/java
./gradlew run
