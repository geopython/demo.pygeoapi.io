#!/bin/bash

source ../env.sh

# Only on prod servers, remove process cleanup job
[[ ${SITE_DOMAIN} == "NONE" ]] || sudo /bin/rm /etc/cron.d/pygeoapi_process_cleanup > /dev/null 2>&1

# docker compose down --remove-orphans
