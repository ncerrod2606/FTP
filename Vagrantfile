# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
 
  config.vm.box = "debian/bullseye64"

  config.vm.network "private_network", ip: "192.168.60.101"

  config.vm.hostname = "dns-server"

  config.vm.provision "shell", path: "bootstrap.sh"

  config.vm.synced_folder ".", "/vagrant"
end
