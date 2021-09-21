#!/bin/bash

statuscheck "Bootstrap"

echo "background"

mkdir /root/lab
cp -r /root/dd-continuous-profiler-example /root/lab/.

cd dd-continuous-profiler-example
echo "DD_API_KEY=$DD_API_KEY" > docker.env

echo "foreground"

cd /root/lab

cd dd-continuous-profiler-example

docker-compose up -d
