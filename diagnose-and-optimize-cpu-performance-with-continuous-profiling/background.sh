#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

git clone https://github.com/DataDog/dd-continuous-profiler-example.git

cd dd-continuous-profiler-example && echo "DD_API_KEY=$DD_API_KEY" > docker.env

statusupdate "Bootstrap"
