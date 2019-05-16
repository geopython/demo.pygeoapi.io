#!/bin/bash

export PYGEOAPI_HOME=/pygeoapi
export PYGEOAPI_CONFIG="${PYGEOAPI_HOME}/local.config.yml"
export PYGEOAPI_OPENAPI="${PYGEOAPI_HOME}/local.openapi.yml"

set +e
echo "Trying to generate openapi.yml"
cd ${PYGEOAPI_HOME}

pygeoapi generate-openapi-document -c ${PYGEOAPI_CONFIG} > ${PYGEOAPI_OPENAPI}

if [ $? -ne 0 ] ; then
     echo "openapi.yml could not be generated ERROR, but carry on"
 else
 	 echo "openapi.yml generated continue to pygeoapi"
 fi

pygeoapi serve
