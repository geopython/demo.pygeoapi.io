# pygeoapi CITE demo service - master

Runs latest GitHub master branch of `pygeoapi` using
[Docker Image from DockerHub](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi) with a volume-mounted [local config file](cite.config.yml).

This service is restarted pulling the latest `pygeoapi` Docker Image whenever a new Image is available (via DockerHub autobuild on
the [pygeoapi GitHub master](https://github.com/geopython/pygeoapi) commit or explicitly).

There is also a [stable](../pygeoapi_stable) version that runs the latest `pygeoapi` version also from DockerHub.

The file [env.sh](../env.sh) is sourced in start/stop scripts to populate deploy-host-dependent vars.

## Auto-deploy

Via the [Updater](../update) service this service gets redeployed when a new image is available 
on Dockerhub.
