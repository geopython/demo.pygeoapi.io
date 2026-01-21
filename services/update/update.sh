#!/bin/bash
# Update script to pull/install new version of geopython/pygeoapi:latest Docker Image.
# It will build/restart the containers that use this image.
# Author: Just van den Broecke

echo "Fetching geopython/pygeoapi:latest..."
docker pull geopython/pygeoapi:latest

SERVICES_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd)"
SERVICES="pygeoapi_master pygeoapi_cite pygeoapi_covid-19"
for SERVICE in ${SERVICES}
do
  pushd ${SERVICES_DIR}/${SERVICE} || exit
    echo "Updating SERVICE=${SERVICE} ..."
    ./stop.sh && ./start.sh
  popd || exit
done

echo "Cleaning up..."
docker-clean.sh
