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

FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.6

LABEL maintainer="jorge.dejesus@geocat.net justb4@gmail.com"
ARG DATA_FOLDER=/usr/share/elasticsearch/data

USER root

COPY docker-entrypoint.sh  /docker-entrypoint.sh
COPY add_data.sh /add_data.sh

RUN wget https://raw.githubusercontent.com/geopython/pygeoapi/master/tests/cite/ogcapi-features/canada-hydat-daily-mean-02HC003.geojson -O ${DATA_FOLDER}/canada-hydat-daily-mean-02HC003.geojson
RUN wget https://raw.githubusercontent.com/geopython/pygeoapi/master/tests/load_es_data.py -O /load_es_data.py

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O bin/wait-for-it.sh
RUN chmod +x bin/wait-for-it.sh

RUN echo "xpack.security.enabled: false" >> config/elasticsearch.yml
RUN echo "http.host: 0.0.0.0" >> config/elasticsearch.yml

RUN yum --enablerepo=extras -y install epel-release \
	&& yum install -y python-pip \
	&& yum install -y python-setuptools \
	&& pip install --upgrade pip && pip install elasticsearch \
	&& yum clean packages

USER elasticsearch

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

ENTRYPOINT ["/docker-entrypoint.sh"]
