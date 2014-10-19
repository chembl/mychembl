cd /tmp
sudo git clone https://github.com/chembl/mychembl_webapp.git
sudo git clone https://github.com/chembl/mychembl.git
sudo rm /var/www -rf
sudo mkdir -p /var/www/html/mychembl
sudo cp -r mychembl/launchpad/* /var/www/html/
sudo cp -r mychembl/launchpad/.htaccess /var/www/html/
sudo cp -r mychembl_webapp/* /var/www/html/mychembl/
curl -O http://peter-ertl.com/jsme/download/JSME_2013-08-04.zip
unzip JSME_2013-08-04.zip
sudo mv JSME_2013-08-04/jsme /var/www/html/mychembl/static/js/
sudo service apache2 restart
