#!/bin/bash


# Stop and remove possibly old containers
./stop.sh

# Set environment variables
export HOSTNAME
export HTTP_PORT=80
[[ ${HOSTNAME} != PYGEOAPI ]] && HTTP_PORT=8000

# Set Let's Encrypt email - customize as needed
export LETSENCRYPT_EMAIL="just@justobjects.nl"

# Note: acme.json is now stored in Docker volume 'acme_certificates'
# No need to create/chmod acme.json file anymore

docker compose up -d
