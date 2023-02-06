# =================================================================
#
# Authors: Just van den Broecke <justb4@gmail.com>>
#          Jorge Samuel Mendes de Jesus <jorge.dejesus@geocat.net>
#          Tom Kralidis <tomkralidis@gmail.com>
#
# Copyright (c) 2019 Just van den Broecke
# Copyright (c) 2019 Jorge Samuel Mendes de Jesus
# Copyright (c) 2020 Tom Kralidis
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

FROM docker.elastic.co/elasticsearch/elasticsearch:8.6.1

LABEL maintainer="jorge.dejesus@geocat.net justb4@gmail.com tomkralidis@gmail.com"

ARG DATA_FOLDER=/usr/share/elasticsearch/data
ARG DATASET=canada-hydat-daily-mean-02HC003.geojson

ARG BUILD_PACKAGES="python3-pip python3-setuptools wget"
ARG PIP_PACKAGES="pip elasticsearch"
USER root

RUN apt-get update -y \
    && apt-get install -y ${BUILD_PACKAGES} \
    && pip3 install --upgrade ${PIP_PACKAGES} \
    && apt-get clean \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*


RUN wget https://raw.githubusercontent.com/geopython/pygeoapi/master/tests/cite/ogcapi-features/${DATASET} -O ${DATA_FOLDER}/${DATASET} \
    && wget https://raw.githubusercontent.com/geopython/pygeoapi/master/tests/load_es_data.py -O /load_es_data.py \
    && wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O bin/wait-for-it.sh \
    && chmod +x bin/wait-for-it.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY add_data.sh /add_data.sh
RUN chmod +x /*.sh

USER elasticsearch
# CMD ["elasticsearch"]

# EXPOSE 9200 9300

# CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

ENTRYPOINT ["/docker-entrypoint.sh"]
