#!/usr/bin/env bash
#
# hora_atual.sh - exibe hora atual do sistema com saudações
#
# Autor: Lucas Ferreira
# Manutenção: Lucas Ferreira
#
# ---------------------------------------------------------------------------------------------- #
#
# Exemplo de uso:
#     $ ./hora_autal.sh
# Neste exemplo o script retornará a hora atual com saudações (bom dia, boa tarde, boa noite) 
# ---------------------------------------------------------------------------------------------- #
# Histórico:
#
# v1.0 30/11/2020 
#
# ---------------------------------------------------------------------------------------------- #
# Testado em:
# bash 5.0.17(1)-release (x86_64-pc-linux-gnu)

# ----------------------------------------- VARIÁVEIS ------------------------------------------ #
HOUR=$(date +%H)
MIN=$(date +%M)
# ----------------------------------------- EXECUÇÂO ------------------------------------------- #

#------------ Saudações
if [ "$HOUR" -ge 6 -a "$HOUR" -lt 12 ]; then
	echo " Bom dia!"
elif [ "$HOUR" -ge 12 -a "$HOUR" -lt 18 ]; then
	echo " Boa tarde!"
else
	echo " Boa noite!"
fi

#----------- Definindo AM ou PM
if [ "$HOUR" -ge 12 -a "$MIN" -ge 1 ]; then
	AMPM=PM
else
	AMPM=AM
fi

#----------  Exibindo a hora 
HOUR=$(expr "$HOUR" - 12)

echo " A hora atual é: "$HOUR":"$MIN" "$AMPM" " 
