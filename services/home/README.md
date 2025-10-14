# Home Landing Page service

The `Home App` provides pages for the demo server.

## Architecture

The image contains a simple Flask webapp running in gunicorn WSGI server.
The app runs now static webpages. My be expanded in future.

## DockerHub

This image is always built on DockerHub whenever something is committed
to the `master` branch of https://github.com/geopython/demo.pygeoapi.io.

On DockerHub a WebHook triggers a refresh of this service via the
[dockerhub webhook service](../dockerhub).

The file [env.sh](../env.sh) is sourced in start/stop scripts to populate deploy-host-dependent vars.
