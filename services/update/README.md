# Updater 

This directory contains scripts to automatically update services
when new Docker Images become available on DockerHub.
A pull model via a cronjob is used.

NB in the past a 'push' model with a webhook from Dockerhub was used 
but it had complications. The 'pull' model here is more lean.

Note that Updater only runs on production servers.

## Important Scripts

The `config/dynamic` directory contains:
- [cron job](pygeoapi_update.cron) cronjob
- [cron.sh](cron.sh) - script called from cronjob
- [check.sh](check.sh) - checks for new version on DockerHub (compares digest values)
- [update.sh](update.sh) - the actual update script (can be run standalone/manually)
- [start.sh](start.sh) - starts update checker (cronjob)
- [stop.sh](stop.sh) - stops update checker (cronjob)
