#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

sudo apt-get update 
sudo apt-get install -y pkg-config libcairo2-dev
pip3 install -r /root/requirements.txt

until  [ -f /root/docker-compose.yml ]
do
  sleep 2
done

mkdir /root/lab
mv /root/docker-compose.yml /root/lab
cd /root/lab
ln -s /ecommworkshop/ads-service/ads.py
statusupdate files

statuscheck "environment variables"

docker-compose up -d

statusupdate storedog
