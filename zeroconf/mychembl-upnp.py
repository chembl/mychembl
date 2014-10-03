#!/usr/bin/env python
from brisa.core.reactors import install_default_reactor
reactor = install_default_reactor()

from brisa.upnp.device import Device, Service
from brisa.upnp.base_device import BaseDeviceIcon

import netifaces


class myChEMBL(object):

    def __init__(self):
        """ Constructor for the myChEMBL device class, which fills some basic
        information about the device.
        """
        self.server_name = 'myChEMBL'
        self.device = 'myChEMBL'

    def _get_ip(self):
        for iface in netifaces.interfaces():

	    keys = netifaces.ifaddresses(iface).keys()
	    if keys.__len__() > 1:
	        addrdict = netifaces.ifaddresses(iface)[keys[1]][0]

	        if 'addr' in addrdict.keys() and 'broadcast' in addrdict.keys():
	            return  addrdict['addr']

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
                            model_number='v19',
                            model_url='https://github.com/chembl/mychembl',
			    presentation_url='http://'+self._get_ip(),)

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
