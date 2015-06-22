## Chef provisioning / berkshelf / Berksfile is not currenty used

Becasue of the problems we had (some of them described [here](https://stackoverflow.com/questions/23652761/why-berkshelf-vagrant-plugin-ignores-git-source)) we decided to temporarily switch to simple
bash provisioning. This means that Berksfile is not necessary. All you have to do to brew your own mychembl
machine is:

    vagrant up
    
The rest of this document will become relevant when chef and berkshelf will be mature enough to use in production.    

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

