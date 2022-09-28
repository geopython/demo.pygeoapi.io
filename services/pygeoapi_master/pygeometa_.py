# =================================================================
#
# Authors: Tom Kralidis <tomkralidis@gmail.com>
#
# Copyright (c) 2022 Tom Kralidis
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# =================================================================

import json
import logging

from pygeometa.core import read_mcf, validate_mcf
from pygeometa.schemas import get_supported_schemas, load_schema

from pygeoapi.process.base import BaseProcessor, ProcessorExecuteError


LOGGER = logging.getLogger(__name__)

INPUT_MCF = {
    'title': 'Metadata control file (MCF)',
    'description': 'a pygeometa metadata control file (MCF) as JSON',
    'schema': {
        'type': 'object',
        'contentMediaType': 'application/json'
    },
    'minOccurs': 1,
    'maxOccurs': 1,
    'metadata': None,
    'keywords': ['metadata control file', 'mcf']
}

PROCESS_METADATA_VALIDATE = {
    'version': '0.1.0',
    'id': 'pygeometa-metadata-validate',
    'title': {
        'en': 'pygeometa metadata control file (MCF) validation',
    },
    'description': {
        'en': 'Validate metadata from a pygeometa metadata control file (MCF)',
    },
    'keywords': ['pygeometa', 'metadata', 'validate'],
    'links': [{
        'type': 'text/html',
        'rel': 'about',
        'title': 'information',
        'href': 'https://geopython.github.io/pygeometa',
        'hreflang': 'en-US'
    }],
    'inputs': {
        'mcf': INPUT_MCF
    },
    'outputs': {
        'validate-report': {
            'title': 'Validate report',
            'description': 'Validate report',
            'schema': {
                'type': 'object',
                'contentMediaType': 'application/json'
            }
        }
    },
    'example': {
        'inputs': {
            'mcf': {'mcf': {'version': '1.0'}}
        }
    }
}


PROCESS_METADATA_GENERATE = {
    'version': '0.1.0',
    'id': 'pygeometa-metadata-generate',
    'title': {
        'en': 'pygeometa metadata generation',
    },
    'description': {
        'en': 'Generate metadata from a pygeometa metadata control file (MCF)'
    },
    'keywords': ['pygeometa', 'metadata', 'generate'],
    'links': [{
        'type': 'text/html',
        'rel': 'about',
        'title': 'information',
        'href': 'https://geopython.github.io/pygeometa',
        'hreflang': 'en-US'
    }],
    'inputs': {
        'mcf': INPUT_MCF,
        'schema': {
            'title': 'Metadata schema',
            'description': 'Output metadata schema',
            'schema': {
                'type': 'string',
                'enum': list(get_supported_schemas())
            },
            'minOccurs': 1,
            'maxOccurs': 1,
            'metadata': None,
            'keywords': ['metadata', 'schema']
        }
    },
    'outputs': {
        'generation': {
            'title': 'Generated metadata',
            'description': 'Generated metadata',
            'schema': {
                'type': 'object',
                'contentMediaType': 'application/json'
            }
        }
    },
    'example': {
        'inputs': {
            'mcf': {'mcf': {'version': '1.0'}},
            'schema': 'oarec-record'
        }
    }
}


class PygeometaMetadataValidateProcessor(BaseProcessor):
    """pygeometa metadata validate example"""

    def __init__(self, processor_def):
        """
        Initialize object

        :param processor_def: provider definition

        :returns: pygeoapi.process.pygeometa_.PygeometaMetadataValidateProcessor  # noqa
        """

        super().__init__(processor_def, PROCESS_METADATA_VALIDATE)

    def execute(self, data):

        response = None
        mimetype = 'application/json'
        mcf = data.get('mcf')

        if mcf is None:
            msg = 'Missing input MCF'
            LOGGER.error(msg)
            raise ProcessorExecuteError(msg)

        try:
            LOGGER.debug('Validating MCF')
            instance = read_mcf(mcf)
            validate_mcf(instance)
            response = 'Valid MCF'
        except Exception as err:
            response = f'Invalid MCF: {err}'

        outputs = {
            'id': 'validate-report',
            'value': response
        }

        return mimetype, outputs

    def __repr__(self):
        return '<PygeometaMetadataValidateProcessor> {}'.format(self.name)


class PygeometaMetadataGenerateProcessor(BaseProcessor):
    """pygeometa metadata generate example"""

    def __init__(self, processor_def):
        """
        Initialize object

        :param processor_def: provider definition

        :returns: pygeoapi.process.pygeometa_.PygeometaMetadataGenerateProcessor  # noqa
        """

        super().__init__(processor_def, PROCESS_METADATA_GENERATE)

    def execute(self, data):

        response = None
        mimetype = 'application/json'
        mcf = data.get('mcf')
        schema = data.get('schema')

        if None in [mcf, schema]:
            msg = 'Missing input MCF or schema'
            LOGGER.error(msg)
            raise ProcessorExecuteError(msg)

        try:
            LOGGER.debug('Generating metadata')
            instance = read_mcf(mcf)
            schema_object = load_schema(schema)
            response = schema_object.write(instance)
            if schema_object.outputformat == 'json':
                LOGGER.debug('Decoding output into native dict')
                response = json.loads(response)
        except Exception as err:
            response = f'Generation error: {err}'

        outputs = {
            'id': 'generate-report',
            'value': response
        }

        return mimetype, outputs

    def __repr__(self):
        return '<PygeometaMetadataGenerateProcessor> {}'.format(self.name)
