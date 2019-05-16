import logging
import os

# local config, change on server for real config
config = {
    'loglevel': int(os.getenv('ADMIN_LOG_LEVEL', logging.DEBUG))
}
