#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

cd /root/lab
# FIXME: Should be moved back to a datadog repo
git clone https://github.com/ivoanjo/dd-continuous-profiler-example.git
cd dd-continuous-profiler-example
echo "DD_API_KEY=$DD_API_KEY" > docker.env

statusupdate "Starting up..."
