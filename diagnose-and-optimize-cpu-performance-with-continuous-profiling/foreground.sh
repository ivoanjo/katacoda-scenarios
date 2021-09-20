#!/bin/bash

statuscheck "Bootstrap"

cd /root/lab && clear

echo "WIP"

cd dd-continuous-profiler-example

docker-compose up -d
