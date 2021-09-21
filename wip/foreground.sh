#!/bin/bash

statuscheck files

cd /root/lab

printf "DD_API_KEY=$DD_API_KEY\n\
DD_APP_KEY=$DD_APP_KEY\n\
LABUSER=$LABUSER\n\
DB_USERNAME=postgres\n\
DB_PASSWORD=postgres\n\
POSTGRES_HOST=db\n\
POSTGRES_USER=postgres\n\
POSTGRES_PASSWORD=postgres" > .env 

statusupdate "environment variables"

clear

statuscheck "storedog"

python3 /root/cli.py

statusupdate complete
prepenvironment