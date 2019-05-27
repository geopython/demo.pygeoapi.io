#!/bin/bash

echo "Updating pygeoapi..."

cd /srv/pygeoapi && ./stop.sh && docker pull geopython/pygeoapi:latest && ./build.sh && ./start.sh

cd /src/scripts && ./docker-clean.sh
