This directory contains two bash scripts:

 - ws_setup.sh
 - ws_cache_generation.sh

 
 `ws_setup.sh` depends on `ws_cache_generation.sh` and should be called with root priviledges. 
 It attempts to install and configure chembl_webservices and test them.
 
 All configuration files are in `webservices/conf` directory.
 
 Before executing, `apache2` should be installed already.
