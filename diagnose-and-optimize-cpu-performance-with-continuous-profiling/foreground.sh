#!/bin/bash

statuscheck "Starting up..."
cd /root/lab/ && clear
cd dd-continuous-profiler-example/java
echo "Starting gradle..."
./gradlew installDist
echo "Starting app..."
./build/install/movies-api-java/bin/movies-api-java
