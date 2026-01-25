# pygeoapi demo service - master

Runs latest GitHub master branch of `pygeoapi` using
[Docker Image from DockerHub](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi).
volume-mounted with a [local config file](local.config.yml) plus data and a (process) cleanup [cronfile](demo.pygeoapi.io.cron).

The file [env.sh](../env.sh) is sourced in start/stop scripts to populate deploy-host-dependent vars.

There is also a [stable](../pygeoapi_stable) version that runs the latest `pygeoapi` version also from DockerHub.

## Processes Cleanup

To clean up resources (files) within the Docker container created via Processes,
a local cronjob is run (production server only).

- [cron job](process_cleanup.cron) cronjob - logs to `~/process_cleanup.log`

## Auto-deploy

Via the [Updater](../update) service this service gets redeployed when a new image is available 
on Dockerhub.

## Deploy manually
For example if the Dockerfile here, or the config has changed:

* make changes as normal via GitHub
* login to the demo server using the `admin` user

```bash
cd git
git pull  # or ./refresh-git.sh if pull somehow fails
cd services/pygeoapi_master
./stop.sh && /start.sh
# view new container logs
docker logs --follow pygeoapi_master
```
