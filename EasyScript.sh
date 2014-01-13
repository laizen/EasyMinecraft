#!/bin/bash

# Author: Pedro Matias                                          #
# E-mail: b13b41@gmail.com                                      #
# Versão: 0.1                                                   # 
cd /
mkdir minecraftserver
cd minecraftserver
mkdir backup
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.7.4/minecraft_server.1.7.4.jar
wget https://raw.github.com/laizen/EasyMinecraft/master/minecraft
cp minecraft /etc/init.d/
chmod a+x minecraft
update.rc minecraft defaults
exit
