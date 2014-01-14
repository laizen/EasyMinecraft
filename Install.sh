#!/bin/bash

# Author: Pedro Matias                                          #
# E-mail: b13b41@gmail.com                                      #
# Versão: 0.1                                                   # 
cd /
echo "Instalando Dependências"
apt-get install openjdk-6-jre
apt-get install splitvt
apt-get isntall htop
echo "Criando Pastas..."
mkdir minecraftserver
cd minecraftserver
mkdir backup
echo "Baixando Aquivos do Repositorio..."
wget http://173.199.119.117/minecraft_server.jar
wget https://raw.github.com/laizen/EasyMinecraft/master/minecraft
echo "Registrando Serviço"
cp minecraft /etc/init.d/
chmod a+x /etc/init.d/minecraft
update-rc.d minecraft defaults
echo "Fim da Instalação"
sleep 2
exit
