# pygeoapi demo service - stable

Runs latest latest stable version  of `pygeoapi` using
[Docker Image from DockerHub](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi).
with a [local config file](local.config.yml).

There is also a [master](../pygeoapi_master) version, "unstable", that runs the `latest` `pygeoapi` master branch 
also from DockerHub.

The file [env.sh](../env.sh) is sourced in start/stop scripts to populate deploy-host-dependent vars.
