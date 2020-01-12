# pygeoapi CITE demo service - master

Runs latest GitHub master branch of `pygeoapi` using
[Docker Image from DockerHub](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi).
with a [local config file](cite.config.yml).

A local [Docker Image](Dockerfile) is [built](build.sh) named `geopython/pygeoapi_cite:latest` 
that mainly copies in the [CITE config](cite.config.yml).

This was needed (i.s.o. Volume mapping) to have [micro-dockerhub-hook](https://github.com/maccyber/micro-dockerhub-hook)
restart the service (as the webhook is done within a Docker container and Volume mapping within a Volume map does not work).

This service is restarted pulling the latest `pygeoapi` Docker Image whenever a new Image is built (via DockerHub autobuild on
the [pygeoapi GitHub master](https://github.com/geopython/pygeoapi) commit or explicitly).

There is also a [stable](../pygeoapi_stable) version that runs the latest `pygeoapi` version also from DockerHub.
