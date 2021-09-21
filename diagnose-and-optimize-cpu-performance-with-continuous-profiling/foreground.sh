#!/bin/bash

statuscheck "Starting up..."
cd /root/lab/ && clear
cd dd-continuous-profiler-example/java
./gradlew installDist
./build/install/movies-api-java/bin/movies-api-java
