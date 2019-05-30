#!/bin/bash
#
# This stops all service components for pygeoapi stack
#
# Just van den Broecke - 2019
#

SCRIPT_DIR=${0%/*}

SERVICES="dockerhub pygeoapi_master pygeoapi_stable home traefik"

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./stop.sh
	popd
done

# last remove the Docker network
docker network rm pygeoapi-network

./${SCRIPT_DIR}/status.sh
