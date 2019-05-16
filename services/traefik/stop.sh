#!/bin/bash

export HOSTNAME
export HTTP_PORT=80
export ACME_FILE="config/acme.json"

docker-compose stop
docker-compose rm -f
chmod 600 ${ACME_FILE}
