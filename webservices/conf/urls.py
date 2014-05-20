from chembl_webservices import __version__ as ws_version
from django.conf.urls import patterns, include

urlpatterns = patterns('',
    (r'^', include('chembl_webservices.urls')),
    )
