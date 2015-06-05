python -mplatform | grep Ubuntu && export APACHE_NAME="apache2" || export APACHE_NAME="httpd"

cd /tmp
sudo git clone https://github.com/chembl/mychembl_webapp.git
sudo git clone https://github.com/chembl/mychembl.git
sudo rm /var/www/html/* -rf
sudo mkdir -p /var/www/html/mychembl
sudo cp -r mychembl/launchpad/* /var/www/html/
sudo cp -r mychembl/launchpad/.htaccess /var/www/html/
sudo cp -r mychembl_webapp/* /var/www/html/mychembl/
curl -O http://peter-ertl.com/jsme/download/JSME_2013-08-04.zip
unzip JSME_2013-08-04.zip
sudo mv JSME_2013-08-04/jsme /var/www/html/mychembl/static/js/

sudo -E kill -9 $(pidof $APACHE_NAME)
python -mplatform | grep Ubuntu && sudo service apache2 restart || sudo systemctl restart httpd -l
