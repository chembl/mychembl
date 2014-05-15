#!/usr/bin/env python
from brisa.core.reactors import install_default_reactor
reactor = install_default_reactor()

import os,socket,fcntl,struct

from brisa.upnp.device import Device, Service
from brisa.upnp.base_device import BaseDeviceIcon




class myChEMBL(object):

    def __init__(self):
        """ Constructor for the myChEMBL device class, which fills some basic
        information about the device.
        """
        self.server_name = 'myChEMBL'
        self.device = 'myChEMBL'

    def get_ip_address(self,ifname):
	    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

	    return socket.inet_ntoa(fcntl.ioctl(
        	s.fileno(),
        	0x8915,  # SIOCGIFADDR
        	struct.pack('256s', ifname[:15])
    	    )[20:24])


    def _create_device(self):
        """ Creates the root device object which will represent the device
        description.'
        """

        self.device = Device('urn:schemas-upnp-org:device:myChEMBL:1',
                             self.server_name,
                             manufacturer='ChEMBL team',
                             manufacturer_url='https://www.ebi.ac.uk/chembl/',
                             model_name='myChEMBL',
                             model_description='A virtual machine implementation of open data and cheminformatics tools',
                             model_number='v18',
                             model_url='https://github.com/chembl/mychembl',
			     presentation_url='http://'+self.get_ip_address('eth0'),
				)
    def _add_icon(self):

	icon = BaseDeviceIcon('image/png','140','140','8','/chembl.png')
	self.device.icons.append(icon)

    def start(self):
        self._create_device()
	self._add_icon()
	self.device.start()
        reactor.add_after_stop_func(self.device.stop)
        reactor.main()


if __name__ == '__main__':
    device = myChEMBL()
    device.start()
