#!/usr/bin/env bash

# relatorio_host.sh - relatório de informações da máquina local
#
# Autor: Lucas Santos Ferreira
# Manutenção: Lucas Santos Ferreira
# E-mail: lucas_sferreira94@hotmail.com  
#
# ------------------------------------------------------------------------------------------ #
# Script concede informações do host local, como cpu, memória RAM, uso de disco e kernel
#
# Exemplo de uso:
#	./relatorio_host.sh
# ------------------------------------------------------------------------------------------ #
# Histórico:
#
# v1.1 08/11/2020 Autor da mudança: Lucas
#	- Mudança no formato de exibição das informações
#	- Adicionado informações ao cabeçalho
#
# ------------------------------------------------------------------------------------------ #
# Testado em:
#	bash 5.0.17(1)-release (x86_64-pc-linux-gnu)
# ------------------------------------------------------------------------------------------ #

# -------------------------------------- VARIÁVEIS ----------------------------------------- #
HOSTNAME=$(hostname)
DATA=$(date)
UPTIME=$(uptime -s)
KERNEL=$(uname -or)
CPUCORE=$(grep "cpu cores" /proc/cpuinfo |head -n1 |tr '\t' ' ')
CPUVERSION=$(grep "model name" /proc/cpuinfo |head -n1 |tr '\t' ' ')
MEMTOTAL=$(free -h |head -n2 |awk '{print $2}' |tail -n1)
DISCO=$(df -h | sed '/tmpfs/d;/udev/d')
# -------------------------------------- EXECUÇÃO ------------------------------------------ #

echo -e "=======================================================
	Relatório da máquina: $HOSTNAME 
	Máquina ativa desde: $UPTIME"    
echo -e "========================================================
"
echo -e " Versão do Kernel: $KERNEL 

	CPU:
	Quantidade de cores: $CPUCORE 
	Versão CPU: $CPUVERSION 
"
echo -e "========================================================
"
echo -e "Memória total: $MEMTOTAL 
"
echo -e "Partições: 

$DISCO
"
