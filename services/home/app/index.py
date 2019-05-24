import logging
import os
import sys
from datetime import datetime
from functools import wraps, update_wrapper

from config import config
from flask import Flask, render_template, make_response

if __name__ != '__main__':
    # When run with WSGI in Apache we need to extend the PYTHONPATH to find Python modules relative to index.py
    sys.path.insert(0, os.path.dirname(__file__))

app = Flask(__name__)
# app.wsgi_app = ReverseProxied(app.wsgi_app)
app.debug = True

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s %(name)s %(levelname)s %(message)s')

log = logging.getLogger(__name__)
log.setLevel(config['loglevel'])


# Wrapper to disable any kind of caching for all pages
# See http://arusahni.net/blog/2014/03/flask-nocache.html
def nocache(view):
    @wraps(view)
    def no_cache(*args, **kwargs):
        response = make_response(view(*args, **kwargs))
        response.headers['Last-Modified'] = datetime.now()
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, post-check=0, pre-check=0, max-age=0'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '-1'
        return response

    return update_wrapper(no_cache, view)


# Home page
@app.route('/')
@nocache
def home():
    return page('home')


# Specific page
@app.route('/<string:page_name>')
@nocache
def page(page_name):
    if page_name.endswith('.html'):
        page_file = page_name
    else:
        page_file = '%s%s' % (page_name, '.html')

    # Let Flask/Jinja2 render the page
    try:
        result = render_template(page_file)
    except Exception as e:
        result = render_template('error.html')

    return result

if __name__ == '__main__':
    # Run as main via python index.py
    app.run(debug=True, host='0.0.0.0')
