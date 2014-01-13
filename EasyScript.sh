#!/bin/bash

# Author: Pedro Matias                                          #
# E-mail: b13b41@gmail.com                                      #
# Versão: 0.1                                                   # 
cd /
echo "Criando Pastas..."
mkdir minecraftserver
cd minecraftserver
mkdir backup
echo "Baixando Aquivos do Repositorio..."
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.7.4/minecraft_server.1.7.4.jar
wget https://raw.github.com/laizen/EasyMinecraft/master/minecraft
echo "Registrando Serviço"
cp minecraft /etc/init.d/
chmod a+x /etc/init.d/minecraft
update-rc.d minecraft defaults
echo "Fim da Instalação"
sleep 10
exit
