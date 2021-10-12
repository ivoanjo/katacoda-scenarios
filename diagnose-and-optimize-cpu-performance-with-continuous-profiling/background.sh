#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

cd /root/lab
git clone https://github.com/DataDog/dd-continuous-profiler-dash2021.git

cd dd-continuous-profiler-dash2021

# Start up mongodb
docker-compose up -d movies-api-mongo

# Prewarm gradle
#./gradlew compileJava

statusupdate "environment to be ready..."

# Download this so it'll be ready when needed in later steps
# This is on purpose after the status update as learners can start the exercise while this gets going
docker pull datadog/agent:latest
