#!/bin/bash

# Author: Pedro Matias                                          #
# E-mail: b13b41@gmail.com                                      #
# Versão: 0.1                                                   # 
cd /
echo "Salvando Mundo Atual"
service mineserver command save-all
cd home/pedro/
echo "Compactando Mundo"
tar -zcvf minecraft.tar.gz minecraft/
echo "Disponibilizando Para Download"
mv minecraft.tar.gz /var/www/bck/
echo "Fim do Backup"
sleep 2
exit
