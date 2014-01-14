#!/bin/bash

# Author: Pedro Matias                                          #
# E-mail: b13b41@gmail.com                                      #
# Versão: 0.1                                                   # 
echo "Removendo Dependências"
apt-get remove openjdk-6-jre
apt-get remove splitvt
apt-get remove htop
cd /
echo "Deletando Pastas..."
rm -r minecraftserver
echo "Removendo Serviço"
update-rc.d -f  minecraft remove
echo "Desinnstalação Completa"
sleep 2
exit
