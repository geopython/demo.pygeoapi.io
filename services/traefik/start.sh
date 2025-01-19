#!/bin/bash


# Stop and remove possibly old containers
./stop.sh

# Finally run. optionally create protected acme.json
export HOSTNAME
export HTTP_PORT=80
[[ ${HOSTNAME} != PYGEOAPI ]] && HTTP_PORT=8000

export ACME_FILE="config/acme.json"

[[ -f ${ACME_FILE} ]] \
  || echo "${ACME_FILE} does not exist! creating..." \
  && touch ${ACME_FILE}

chmod 600 ${ACME_FILE}
docker compose up -d
