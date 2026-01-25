#!/bin/bash
# Cleanup tempfiles in Container created by pygeoapi Processes.
# Author: Just van den Broecke - 2026

docker exec pygeoapi_master sh -c 'rm -f /tmp/pygeoapi-process-manager.* /tmp/hello-world-*'
