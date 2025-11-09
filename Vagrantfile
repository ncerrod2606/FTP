# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
 
  # Box que se va a usar (Debian 11)
  config.vm.box = "debian/bullseye64"

  # Red NAT (por defecto)
  # Permite acceso a Internet y SSH desde el host
  config.vm.network "forwarded_port", guest: 80, host: 8080  # Redirige puerto 80 de la VM al 8080 del host

  # Red privada
  # IP estática que uso para el servidor DNS
  config.vm.network "private_network", ip: "192.168.5.11"

  # Nombre de la máquina
  config.vm.hostname = "dns-server"

  # Shell script de aprovisionamiento
  # Este script instala y configura el servidor DNS
  config.vm.provision "shell", path: "bootstrap.sh"

  # Compartir carpeta del host con /vagrant en la VM
  # ------------------------------
  # Esto permite copiar ficheros de configuración fácilmente
  config.vm.synced_folder ".", "/vagrant"
end
