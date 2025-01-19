#!/bin/bash

echo "Updating pygeoapi home..."

cd /srv/home && ./stop.sh && docker pull geopython/demo.pygeoapi.io:latest && docker compose up -d

echo "Cleaning up..."

cd /src/scripts && ./docker-clean.sh
