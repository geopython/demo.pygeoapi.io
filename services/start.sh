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

#SERVICES="dockerhub pygeoapi_master pygeoapi_stable pygeoapi_cite pygeoapi_covid-19 home traefik"
# JMDJ disable dockerhub and automatic upgrade so test traefik upgrade
<<<<<<< HEAD
SERVICES="pygeoapi_master pygeoapi_stable pygeoapi_cite pygeoapi_covid-19 home traefik"

=======
#SERVICES="pygeoapi_master pygeoapi_stable pygeoapi_cite pygeoapi_covid-19 home traefik"
SERVICES="pygeoapi_master traefik"
>>>>>>> 46748acf3a801ab93902826a8a2aefb61d7efcb3
for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./start.sh
	popd
done

./${SCRIPT_DIR}/status.sh
