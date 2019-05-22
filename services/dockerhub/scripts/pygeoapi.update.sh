#!/bin/bash

echo "Updating pygeoapi..."

cd /srv/pygeoapi && docker-compose pull && docker-compose rm --force --stop && docker-compose up -d
