#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir /root/lab
cp -r /root/dd-continuous-profiler-example /root/lab/.

cd dd-continuous-profiler-example && echo "DD_API_KEY=$DD_API_KEY" > docker.env

statusupdate "Bootstrap"
