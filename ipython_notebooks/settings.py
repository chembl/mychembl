import os, sys
import threading
threading._DummyThread._Thread__stop = lambda x: 42

DEBUG = False

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'chembl_19', # Or path to database file if using sqlite3.
        'USER': 'chembl', # Not used with sqlite3.
        'PASSWORD': '', # Not used witis oracle
        'HOST': '', # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '5432', # Set to empty string for default. Not used with sqlite3.
    },
}

EXPORT_MODE = True
CORE_TABLES_MANAGED = False
APP_SPECIFIC_TABLES_MANAGED = False
COMPOUND_MOLS_TABLE = 'mols_rdkit'
CTAB_COLUMN = 'm'

SECRET_KEY = '3v2xb&amp;@&amp;_kibf0o!4m249njy3!qjxptht0m%q2w&amp;ry8v&amp;ok$na'

INSTALLED_APPS = (
    'chembl_core_db',
    'chembl_core_model',
    'chembl_webservices',
    )

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        },

        'rot_file': {
            'level': 'INFO',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': '/tmp/django_router.log'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.db.DatabaseCache',
        'LOCATION': 'ws_cache',
        }
}

CACHE_MIDDLEWARE_SECONDS = 3000000

