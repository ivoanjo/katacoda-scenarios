#!/bin/bash
statuscheck "environment to be ready..."
cd /root/lab/ && clear
cd dd-continuous-profiler-example/java

# Start up mongodb
docker run -p 27017:27017 -v `pwd`/mongo-seed:/docker-entrypoint-initdb.d mongo:latest

# Prewarm gradle
./gradlew
