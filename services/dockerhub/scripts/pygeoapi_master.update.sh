#!/bin/bash

echo "Updating pygeoapi..."

cd /srv/pygeoapi_master && ./stop.sh && docker pull geopython/pygeoapi:latest && ./build.sh && docker-compose up -d

cd /src/scripts && ./docker-clean.sh
