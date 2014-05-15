## myChEMBL auto discovery

# AVAHI

Tutorial followed from http://peterlaszlo.wordpress.com/2013/06/27/bonjour-avahi-rpi-windows/

	1. apt-get install libnss-mdns avahi-utils
	2. sudo mod probe ipv6 (Just in case it’s not a included module, add it to /etc/modules).
	3. Copy the mychembl.service to /etc/avahi/services/
	4. sudo service avahi-daemon restart

# Universal Plug and Play

Slightly more involved installation due to dependencies.

	1. Install setup tools for Python (ez_setup.py)
	2. sudo apt-get install python-dev python-gobject
	3. sudo easy_install https://garage.maemo.org/frs/download.php/8363/python-brisa_0.10.3maemo0.tar.gz paste
	4. Copy the mychembl-upnp.conf upstart file to /etc/init
	5. Copy the mychembl-upnp.py to /usr/bin/ (Don’t forget to chmod +x!)
	6. sudo service mychembl-upnp start


Providing both host and client machines are running on a bridged network (IP Address via DHCP), the myChEMBL instance will appear as a device in the network browser explorer pane on Windows based computers and as myChEMBL.local in Mac OS X / Linux, with Bonjour / AVAHI support enabled.


