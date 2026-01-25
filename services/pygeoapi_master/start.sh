#!/bin/bash

./stop.sh
source ../env.sh

docker compose up -d

# Only on prod servers, add process cleanup job
[[ ${SITE_DOMAIN} == "NONE" ]] || sudo cp process_cleanup.cron /etc/cron.d/pygeoapi_process_cleanup
