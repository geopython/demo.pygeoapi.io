#!/bin/bash

echo "Updating pygeoapi_master..."

docker pull geopython/pygeoapi:latest

cd /srv/pygeoapi_master && ./stop.sh && ./build.sh && docker-compose up -d

echo "Updating pygeoapi_cite..."

cd /srv/pygeoapi_cite && ./stop.sh && ./build.sh && docker-compose up -d

echo "Updating pygeoapi_covid-19..."

cd /srv/pygeoapi_covid-19 && ./stop.sh && ./build.sh && docker-compose up -d

echo "Cleaning up..."

cd /src/scripts && ./docker-clean.sh
