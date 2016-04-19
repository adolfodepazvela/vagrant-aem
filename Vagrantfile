# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.synced_folder "provision", "/tmp/install"

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "hashicorp/precise64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  	config.vm.define "author", primary: true do |author|
 		author.vm.box = "precise/ubuntu64jdk8"
    	author.vm.hostname = 'author'
    	author.vm.box_url = "precise/ubuntu64jdk8"
    	author.vm.network :private_network, ip: "192.168.56.101"
    	author.vm.network :forwarded_port, guest: 4502, host: 4502, auto_correct: true
    	author.vm.synced_folder "aem/author", "/aem/author"
    	author.vm.provider :virtualbox do |v|
      		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      		v.customize ["modifyvm", :id, "--memory", 3048]
      		v.customize ["modifyvm", :id, "--name", "author"]
    	end
    	author.vm.provision "shell" do |s|
    		s.path = "provision/setup-author.sh"
    	end
  	end
  	config.vm.define "publisher", autostart: false do |publisher|
 		publisher.vm.box = "precise/ubuntu64jdk8"
    	publisher.vm.hostname = 'publisher'
    	publisher.vm.box_url = "precise/ubuntu64jdk8"
    	publisher.vm.network :private_network, ip: "192.168.56.102"
    	publisher.vm.network :forwarded_port, guest: 4503, host: 4503, auto_correct: true
    	publisher.vm.synced_folder "aem/publisher", "/aem/publisher"
    	publisher.vm.provider :virtualbox do |v|
      		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      		v.customize ["modifyvm", :id, "--memory", 2048]
      		v.customize ["modifyvm", :id, "--name", "publisher"]
    	end
    	publisher.vm.provision "shell" do |s|
    		s.path = "provision/setup-publisher.sh"
    	end
  	end
  	config.vm.define "dispatcher", autostart: false do |dispatcher|
 		dispatcher.vm.box = "hashicorp/precise64"
    	dispatcher.vm.hostname = 'dispatcher'
    	dispatcher.vm.box_url = "ubuntu/precise64"
    	dispatcher.vm.network :private_network, ip: "192.168.56.103"
    	dispatcher.vm.network :forwarded_port, guest: 80, host: 80, auto_correct: true
    	dispatcher.vm.provider :virtualbox do |v|
      		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      		v.customize ["modifyvm", :id, "--memory", 1024]
      		v.customize ["modifyvm", :id, "--name", "dispatcher"]
    	end
    	dispatcher.vm.provision "shell" do |s|
    		s.path = "provision/setup-dispatcher.sh"
    	end
  
  	end

end
