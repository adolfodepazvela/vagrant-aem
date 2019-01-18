# vagrant-aem

## In Progress Version


## Install the latest versions

- Install Vagrant : https://www.vagrantup.com/downloads.html
- Install Virtual box : https://www.virtualbox.org/wiki/Downloads
- Install Vagrant Manager : https://github.com/lanayotech/vagrant-manager/releases


## Clone

- git clone https://github.com/adolfodepazvela/vagrant-aem.git


## Prepare 

- Copy license.properties inside aem/auhtor directory
- Copy license.properties inside aem/publisher directory
- Copy aem-author-4502.jar inside aem/author directory
- Copy aem-publish-4503.jar inside aem/publisher directory


## Author 

- vagrant up author
- vagrant ssh author or via putty
- $ sudo service aemStart start
- http://192.168.56.101:4502


## Publisher 

- vagrant up author
- vagrant ssh author or via putty
- $sudo service aemStart start
- http://192.168.56.102:4503

## Dispatcher

- vagrant up dispatcher


