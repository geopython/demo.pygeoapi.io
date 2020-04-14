#!/bin/bash
#
# This starts all service components for pygeoapi stack
# You must first have done ./build.sh
#
# Just van den Broecke - 2019
#

SCRIPT_DIR=${0%/*}

# first create the Docker network
docker network create --driver bridge pygeoapi-network

SERVICES="dockerhub pygeoapi_master pygeoapi_stable pygeoapi_cite pygeopai_covid-19 home traefik"

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./start.sh
	popd
done

./${SCRIPT_DIR}/status.sh
