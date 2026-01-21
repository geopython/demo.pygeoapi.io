#!/bin/bash

source ../env.sh

# Only on prod servers
[[ ${SITE_DOMAIN} == "NONE" ]] && exit 0

sudo cp pygeoapi_update.cron /etc/cron.d/
