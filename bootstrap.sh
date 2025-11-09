#!/bin/bash
set -e

# Actualiza los paquetes e instala BIND9 y utilidades relacionadas
echo "Actualizando paquetes e instalando BIND9..."
sudo apt-get update -y
sudo apt-get install -y bind9 bind9utils bind9-doc

# Copia los archivos de configuración necesarios para BIND9
echo "Copiando ficheros de configuración..."
sudo cp /vagrant/config/named /etc/default/named
sudo cp /vagrant/config/named.conf.options /etc/bind/named.conf.options
sudo cp /vagrant/config/named.conf.local /etc/bind/named.conf.local
sudo cp /vagrant/config/nicolas.test.dns /var/lib/bind/nicolas.test.dns
sudo cp /vagrant/config/nicolas.test.rev /var/lib/bind/nicolas.test.rev

# Verifica la sintaxis de los archivos de configuración de BIND9
echo "Verificando sintaxis de BIND..."
sudo named-checkconf
sudo named-checkzone nicolas.test /var/lib/bind/nicolas.test.dns
sudo named-checkzone 5.168.192.in-addr.arpa /var/lib/bind/nicolas.test.rev

# Reinicia el servicio de BIND9 para aplicar los cambios
echo "Reiniciando BIND9..."
sudo systemctl restart bind9

# Mensaje de finalización del proceso de provisionamiento
echo "Provisionamiento completado"