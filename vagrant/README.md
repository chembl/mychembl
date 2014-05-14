## How to install berkshelf vagrant plugin

The only way I managed to install barkshelf vagrant plugin on Mavericks is by the following command:

    sudo NOKOGIRI_USE_SYSTEM_LIBRARIES=1 vagrant plugin install vagrant-berkshelf --plugin-version=2.0.1

## Running vagrant/provisioning:

Due to some strange bug in berkshelf, vagrant up will not correctly provision VM on the first time.
Ususally what you need to do is:

    vagrant up
    vagrant halt
    vagrant destroy
    vagrant up

