# vagrant-aem

## In Progress Version


## Install the latest

- Install Virtualbox
- Install Vagrant 

## Prepare the Java Machine

- git clone https://github.com/adolfodepazvela/java-8-ubuntu-precise.git
- vagrant up
- vagrant package --output ubuntu64jdk8.box
- vagrant box add precise/ubuntu64jdk8 ubuntu64jdk8.box

## Cllone

- git clone https://github.com/adolfodepazvela/vagrant-aem.git


## Prepare 

- Copy license.properties inside vagrant-aem/provision directory
- Copy aem-61.jar inside vagrant-aem/provision directory
- Copy oak-run-1.2.2.jar inside vagrant-aem/provision directory (http://mvnrepository.com/artifact/org.apache.jackrabbit/oak-run/1.2.2)

### Create the following folders

- mkdir vagrant-aem/aem
- mkdir vagrant-aem/aem/author
- mkdir vagrant-aem/aem/publisher
- mkdir vagrant-aem/aem/dispatcher


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


