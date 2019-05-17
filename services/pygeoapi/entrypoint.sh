#!/bin/bash

# Runs the pygeoapi app with gunicorn

echo "START /entrypoint.sh"

export PYGEOAPI_HOME=/pygeoapi
export PYGEOAPI_CONFIG="${PYGEOAPI_HOME}/local.config.yml"
export PYGEOAPI_OPENAPI="${PYGEOAPI_HOME}/local.openapi.yml"

set +e
cd ${PYGEOAPI_HOME}

echo "Trying to generate openapi.yml"
pygeoapi generate-openapi-document -c ${PYGEOAPI_CONFIG} > ${PYGEOAPI_OPENAPI}

if [ $? -ne 0 ] ; then
     echo "openapi.yml could not be generated ERROR"
     exit -1
fi

echo "openapi.yml generated continue to pygeoapi"

# SCRIPT_NAME should not have value '/'
[ "${SCRIPT_NAME}" = '/' ] && export SCRIPT_NAME="" && echo "make SCRIPT_NAME empty from /"

echo "Running pygeoapi  WSGI on ${CONTAINER_HOST}:${CONTAINER_PORT} with ${WSGI_WORKERS} workers and SCRIPT_NAME=${SCRIPT_NAME}"
gunicorn --workers ${WSGI_WORKERS} \
		--worker-class=${WSGI_WORKER_CLASS} \
		--timeout ${WSGI_WORKER_TIMEOUT} \
		--name=${CONTAINER_NAME} \
		--bind ${CONTAINER_HOST}:${CONTAINER_PORT} \
		pygeoapi.flask_app:APP

echo "END /entrypoint.sh"
