#!/bin/bash

statuscheck "Bootstrap"

cd /root/lab/ && clear

cd dd-continuous-profiler-example

docker-compose up -d
