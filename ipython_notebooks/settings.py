DEBUG = False

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'chembl_XXX', # Or path to database file if using sqlite3.
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
    )
