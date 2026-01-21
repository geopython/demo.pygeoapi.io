#!/bin/bash

source ../env.sh

# Only on prod server
[[ ${SITE_DOMAIN} == "NONE" ]] && exit 0

sudo /bin/rm /etc/cron.d/pygeoapi_update.cron
