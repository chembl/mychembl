import os
import sys
import site
site.addsitedir('/home/chembl/.virtualenvs/chembl_beaker/lib/python2.7/site-packages/')
sys.path.append('/home/chembl/chembl_beaker/conf.d')

from bottle import debug
import json
from chembl_beaker.beaker import app, config, loadPlugins, loadApps

conf_path = "/home/chembl/chembl_beaker/conf.d/beaker.conf"
config.load_config(conf_path)

apps = json.loads(config.get('installed_apps', '[]'))
plugins = json.loads(config.get('plugins', '[]'))

loadApps(apps)
loadPlugins(app, plugins)

debug(True)

application = app
