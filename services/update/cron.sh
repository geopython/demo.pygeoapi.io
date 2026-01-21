#!/bin/bash
# Check for new/different remote version of geopython/pygeoapi:latest Docker Image.
# Pull new image and restart services if changed.
# Author: Just van den Broecke

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

${DIR}/check.sh

[[ $? == 1 ]] && echo "UPDATE"
