# Sample metadata records from Dutch Nationaal georegister

- Description: XML files fron Dutch Nationaal georegister used to populate TinyDB
- Source: nationalgeoregister.nl
- URL: https://nationaalgeoregister.nl
- Copyright: [CC0](https://creativecommons.org/share-your-work/public-domain/cc0)

## Populating TinyDB backend from XML files

```bash
curl -O https://raw.githubusercontent.com/geopython/pygeoapi/master/tests/load_tinydb_records.py
mkdir -p /tmp/sample-records
unzip demo.pygeoapi.io/services/pygeoapi_master/data/nationaalgeoregister.nl/sample-records.zip -d /tmp/sample-records
python3 load_tinydb_records.py /tmp/sample-records demo.pygeoapi.io/services/pygeoapi_master/data/nationaalgeoregister.nl/sample-records.tinydb
```
