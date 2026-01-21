#!/bin/bash
# Check for new/different remote version of geopython/pygeoapi:latest Docker Image.
# Pull new image and restart services if changed.
# Author: Just van den Broecke

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Do check: exit code 0 if no new image, else 1.
${DIR}/check.sh

# Do update if check indicates new image (exit code 1).
[[ $? == 1 ]] && ${DIR}/update.sh
