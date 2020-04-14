#!/bin/bash

#########################################################################################
#											#
#   SCRIPT PARA EXIBIÇÃO DE INFORMAÇÕES SOBRE A MÁQUINA E O SISTEMA OPERACIONAL         #
#											#
#											#
#########################################################################################
echo

NOMEMAQUINA=$(uname -a | cut -d " " -f1,2)
DATAHORA=$(date)
UPTIME=$(uptime -s)
KERNEL=$(uname -r)
CPUCORE=$(cat /proc/cpuinfo | grep "cpu cores" | cut -d ":" -f2 | head -n1)
CPUMODEL=$(cat /proc/cpuinfo | grep "model name" | cut -d ":" -f2 | head -n1)
MEMTOTAL=$(cat /proc/meminfo | grep "MemTotal" | cut -d ":" -f2)
PARTROOT=$(df -h |grep "/dev/mapper"| grep "root")
PARTHOME=$(df -h |grep "/dev/mapper" |grep "home")
PARTSDA=$(df -h | grep "/dev/sda")
PARTSDC=$(df -h | grep "/dev/sdc")

echo "========================================"
echo "Relatorio da maquina: $NOMEDAMAQUINA"
echo "Data/Hora: $DATAHORA"
echo "========================================"
echo

echo "Maquina ativa desde: $UPTIME"
echo "Versao do kernel: $KERNEL"
echo

echo "CPUs"
echo "Quantidade de CPUs/Core: $CPUCORE"
echo "Modelo da CPU: $CPUMODEL"
echo

echo "Memoria Total: $MEMTOTAL"
echo

echo "Particoes"
echo
echo " Sist. Arquivos	    		       Tam. Usado  Disp.  Uso%  Montado em"
echo "$PARTROOT" 
echo "$PARTHOME"
echo "$PARTSDA"
echo "$PARTSDC"
