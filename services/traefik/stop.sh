#!/bin/bash

export HOSTNAME
export HTTP_PORT=80
[[ ${HOSTNAME} != PYGEOAPI ]] && HTTP_PORT=8000

docker compose down --remove-orphans
