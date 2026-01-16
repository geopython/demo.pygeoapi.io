# DockerHub Hook

This service is invoked via HTTP whenever a Docker Image build is made on DockerHub.
It is based on [micro-dockerhub-hook](https://github.com/maccyber/micro-dockerhub-hook).

For now this applies to DockerHub Images:

* [geopython/pygeoapi:latest](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi)
* [geopython/demo.pygeoapi.io:latest](https://cloud.docker.com/u/geopython/repository/docker/geopython/demo.pygeoapi.io) - the `home` app

The file [env.sh](../env.sh) is sourced in start/stop scripts to populate deploy-host-dependent vars.

The local [env.sh](env.sh) is mounted as to cover for the pygeoapi services started within
the dockerhub container here.
