#!/bin/bash

echo "Updating pygeoapi_master..."

cd /srv/pygeoapi_master && ./stop.sh && docker pull geopython/pygeoapi:latest && ./build.sh && docker-compose up -d

echo "Updating pygeoapi_cite..."

cd /srv/pygeoapi_cite && ./stop.sh && docker pull geopython/pygeoapi:latest && ./build.sh && docker-compose up -d

echo "Cleaning up..."

cd /src/scripts && ./docker-clean.sh
