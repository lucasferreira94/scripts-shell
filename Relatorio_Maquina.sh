#!/bin/bash

#############################################################################
# Script para exibição de relatório de informações da máquina local         # 
#                                                                           #
# Autor: Lucas Santos Ferreira  email: lucas_sferreira94@hotmail.com        #
#                                                                           #
# Execução: ./Relatorio_Maquina.sh                                          # 
#                                                                           # 
#############################################################################

clear
echo " "

HOSTNAME=$(hostname)
DATA=$(date)
UPTIME=$(uptime -s)
KERNEL=$(uname -or)
CPUCORE=$(grep "cpu cores" /proc/cpuinfo |head -n1 |tr '\t' ' ')
CPUVERSION=$(grep "model name" /proc/cpuinfo |head -n1 |tr '\t' ' ')
MEMTOTAL=$(free -h |head -n2 |awk '{print $2}' |tail -n1)
DISCO=$(df -h |grep -v "tmp" |grep -v "udev" |grep -v "loop")

echo "======================================================================================="
echo " "
echo " Relatório da máquina: $HOSTNAME "
echo " Máquina ativa desde: $UPTIME    "
echo " "
echo "======================================================================================="
echo " "

echo " Versão do Kernel: $KERNEL "
echo " "
echo " CPU:"
echo " Quantidade de cores: $CPUCORE "
echo " Versão CPU: $CPUVERSION "
echo " "
echo "======================================================================================="

echo " "
echo " Memória total: $MEMTOTAL "
echo " "

echo " Partições: "
echo " "
echo " $DISCO "
echo " "
echo "======================================================================================="
