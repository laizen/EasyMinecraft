#!/bin/bash
#Autor: Pedro Matias
#Programa de criaÃ§Ã£o de backup full
#DATA: 13/02/2014
echo "Backup Server Minecraft"
echo " "

dadosfull() {
cd /home/pedro/newminecraft/
DATA=`date +%x-%k.%M.%S` #pega data atual
TIME_BKCP=+5 #numero de dias em que sera deletado o arquivo de backup
ARQ=mineworld-$DATA.tar.gz
#data de inicio backup
DATAIN=`date +%c`
echo "Data de inicio: $DATAIN"

}

backupfull(){
tar -czvf $ARQ ./world/
mv ./$ARQ /var/www/bck/
if [ $? -eq 0 ] ; then
   echo "----------------------------------------"
        echo "Backup Full concluido com Sucesso"
   DATAFIN=`date +%c`
   echo "Data de termino: $DATAFIN"
   echo "Backup realizado com sucesso" >> /var/www/bck/logs/backup_full.log
   echo "Criado pelo usuario: $USER" >> /var/www/bck/logs/backup_full.log
   echo "INICIO: $DATAIN" >> /var/www/bck/logs/backup_full.log
   echo "FIM: $DATAFIN" >> /var/www/bck/logs/backup_full.log
   echo "-----------------------------------------" >> /var/www/bck/logs/backup_full.log
   echo " "
   echo "Log gerado em /var/www/bck/logs/backup_full.log"
else
   echo "ERRO! Backup do dia $DATAIN" >> /var/www/bck/logs/backup_full.log
fi
}

procuraedestroifull(){

#apagando arquivos mais antigos (a mais de 20 dias que existe)
find $DSTDIR -name "f*" -ctime $TIME_BKCP -exec rm -f {} ";"
   if [ $? -eq 0 ] ; then
      echo "Arquivo de backup mais antigo eliminado com sucesso!"
   else
      echo "Erro durante a busca e destruiÃ§Ã£o do backup antigo!"
   fi
      echo "Erro durante a busca e destruiÃ§Ã£o do backup antigo!"
   fi
}

dadosfull
backupfull
procuraedestroifull

exit 0
