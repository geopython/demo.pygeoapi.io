#!/bin/bash

echo "Updating pygeoapi..."

cd /srv/home && ./stop.sh && docker pull geopython/demo.pygeoapi.io:latest && ./start.sh

cd /src/scripts && ./docker-clean.sh