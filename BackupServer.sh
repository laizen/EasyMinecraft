#!/bin/bash
echo "Backup Server Minecraft"
#Autor: Pedro Matias
#Programa de criação de backup full
#DATA: 13/02/2014
echo " "

dadosfull() {

SRCDIR="/home/jhoni /etc" #diretórios que serão feito backup
DSTDIR=/mnt/extra #diretório de destino do backup
DATA=`date +%x-%k%M%S` #pega data atual
TIME_BKCP=+15 #número de dias em que será deletado o arquivo de backup

#criar o arquivo full-data.tar no diretório de destino
ARQ=$DSTDIR/full-$DATA.tar.gz
#data de inicio backup
DATAIN=`date +%c`
echo "Data de inicio: $DATAIN"

}

backupfull(){
sync
tar -czvf $ARQ $SRCDIR 
if [ $? -eq 0 ] ; then
   echo "----------------------------------------"
        echo "Backup Full concluído com Sucesso"
   DATAFIN=`date +%c`
   echo "Data de termino: $DATAFIN"
   echo "Backup realizado com sucesso" >> /var/log/backup_full.log
   echo "Criado pelo usuário: $USER" >> /var/log/backup_full.log
   echo "INICIO: $DATAIN" >> /var/log/backup_full.log
   echo "FIM: $DATAFIN" >> /var/log/backup_full.log
   echo "-----------------------------------------" >> /var/log/backup_full.log
   echo " "
   echo "Log gerado em /var/log/backup_full.log"

else
   echo "ERRO! Backup do dia $DATAIN" >> /var/log/backup_full.log
fi   
}

procuraedestroifull(){

#apagando arquivos mais antigos (a mais de 20 dias que existe)
find $DSTDIR -name "f*" -ctime $TIME_BKCP -exec rm -f {} ";"
   if [ $? -eq 0 ] ; then
      echo "Arquivo de backup mais antigo eliminado com sucesso!"
   else
      echo "Erro durante a busca e destruição do backup antigo!"
   fi
}


exit 0
