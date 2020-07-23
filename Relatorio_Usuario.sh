#!/bin/bash

#############################################################################
# Script para exibição de relatório de informações da máquina local         # 
#                                                                           #
# Autor: Lucas Santos Ferreira  email: lucas_sferreira94@hotmail.com        #
#                                                                           #
# Execução: ./Relatorio_Usuario.sh <usuario>                                # 
#                                                                           # 
#############################################################################

ls /home/$1 > /dev/null 2>&1 || { echo "Usuário inexistente" ; sleep 3 ; exit 1; }

 # Caso o parametro usuario exista, ele segue a execuçao do script
 # Caso o usuário digitado não exista, irá exibir a mensagem

INFOUSR=$(grep $1 /etc/passwd |awk -F : '{print $3}')
NAMECOMP=$(grep $1 /etc/passwd |awk -F : '{print $5}' |cut -d "," -f1 )
HOMEUSAGE=$(du -sh /home/$1 |cut -f1)
LASTLOG=$(lastlog -u $1)

clear
echo ""
echo "============ Relatório do usuário $1 =============="
echo ""

echo " UID: $INFOUSR"
echo " Nome ou Descrição: $NAMECOMP"
echo ""

echo " Total usado no /home/$1: $HOMEUSAGE"
echo ""
echo " Último login: $LASTLOG" 
echo ""
echo "======================================================="
