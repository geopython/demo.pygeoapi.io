#!/bin/bash
# Check for new/different remote version of geopython/pygeoapi:latest Docker Image.
# Does exit 1 when not equal, otherwise exit 0.
# Client like cron.sh may check $? exit code and take action.
# NB needs jq to be installed1
#
# Author: Just van den Broecke

DOCKER_IMAGE=geopython/pygeoapi
IMAGE_VERSION=latest

function digest_remote() {
  # Getting digest of the remote image:
  curl -s "https://hub.docker.com/v2/repositories/${DOCKER_IMAGE}/tags?name=${IMAGE_VERSION}" -H 'Content-Type: application/json' | jq -r '.results[].digest'

  # output e.g. sha256:7532dbc1f3626e5db1f6d1f95b6f067643635bd8abeb893493d8494cd0f3d26a
}

function digest_local() {
  # Getting digest of the local image:
  docker inspect ${DOCKER_IMAGE}:${IMAGE_VERSION}  --format '{{ index .RepoDigests 0 }}' | cut -d'@' -f2

  # output e.g. sha256:f123373c8ad8d93117e372e85e8c1ee3b96b6ee0f2422bc04101e2711b04fa01
}

# Compare the digests, if equal throw exit code 0
[[ $(digest_remote) == $(digest_local) ]] && exit 0

# Not the same: output exit code 1
exit 1
