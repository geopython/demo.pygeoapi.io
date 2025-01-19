import logging
import os

base_url = 'https://demo.pygeoapi.io'

# local config, change on server for real config
config = {
    'loglevel': int(os.getenv('ADMIN_LOG_LEVEL', logging.DEBUG))
}

services = [
    {'href': '/master', 'title': "pygeoapi - latest GitHub 'master' version"},
    {'href': '/stable', 'title': 'pygeoapi - latest stable version'},
    {'href': '/cite', 'title': "pygeoapi - CITE endpoint - latest GitHub 'master' version"},  # noqa
    {'href': '/covid-19', 'title': "pygeoapi - COVID-19 endpoint - latest GitHub 'master' version"}  # noqa
]
