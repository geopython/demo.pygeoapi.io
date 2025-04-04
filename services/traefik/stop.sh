#!/bin/bash

export HOSTNAME
export HTTP_PORT=80
[[ ${HOSTNAME} != PYGEOAPI ]] && HTTP_PORT=8000
export ACME_FILE="config/acme.json"

docker compose down --remove-orphans
chmod 600 ${ACME_FILE}
