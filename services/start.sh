#!/bin/bash
#
# This starts all service components for pygeoapi stack
#
# Just van den Broecke - 2019-2026
#

SCRIPT_DIR=${0%/*}

# first create the Docker network
docker network create --driver bridge pygeoapi-network

SERVICES="pygeoapi_master pygeoapi_stable pygeoapi_cite pygeoapi_covid-19 home traefik update"

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./start.sh
	popd
done

./${SCRIPT_DIR}/status.sh
