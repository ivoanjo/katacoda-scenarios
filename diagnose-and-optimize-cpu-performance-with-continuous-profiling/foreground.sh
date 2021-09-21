#!/bin/bash

statuscheck "Starting up..."
cd /root/lab/ && clear

cd dd-continuous-profiler-example
docker-compose up -d
