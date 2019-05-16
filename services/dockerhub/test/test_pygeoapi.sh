#!/bin/bash
source ../dockerhub.env
echo "TOKEN=${TOKEN}"
curl -i -H "Content-Type: application/json" \
     -X POST \
     -d @./payload_pygeoapi.json \
     http://localhost:3000/${DOCKER_HUB_PATH}

