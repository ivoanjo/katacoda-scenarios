#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

cd /root/lab
# FIXME: Should be moved back to a datadog repo
git clone https://github.com/ivoanjo/dd-continuous-profiler-example.git

cd dd-continuous-profiler-example/java

# Start up mongodb
docker run -p 27017:27017 -v `pwd`/mongo-seed:/docker-entrypoint-initdb.d mongo:latest

# Prewarm gradle
./gradlew

statusupdate "environment to be ready..."

# Download this so it'll be ready when needed in later steps
docker pull datadog/agent:latest
