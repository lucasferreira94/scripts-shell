#!/usr/bin/env bash
#
# hora_atual.sh - Script apresenta a hora atual do sistema no formato [1-12] AM/PM
#
# Autor: Lucas Ferreira
# Manutenção: Lucas Ferreira
#
# ----------------------------------------------------------------------------------- #
# Modo de uso:
#   	$ ./hora_atual.sh
# -------------------------------------------------------------------------------------- #
# Histórico:
#
# v1.1 14/11/2020 Autor da mudança: Lucas Ferreira
#	- Adicionado um novo cabeçalho
#	- Adicionado cores para exibição da hora de acordo com horário atual do sistema
# -------------------------------------------------------------------------------------- #
# Testado em:
#	5.0.17(1)-release (x86_64-redhat-linux-gnu)
# -------------------------------------------------------------------------------------- #

# -------------------------------- VARIÁVEIS ------------------------------------------- #
HOUR=$(date +%H)
MIN=$(date +%M)
AMARELO="\033[33;1m"
ROXO="\033[35;1m"
CIANO="\033[36;1m"
# -------------------------------------------------------------------------------------- #
# Definindo

if [ "$HOUR" -ge 6 -a "$HOUR" -lt 12 ]
then
	echo -e "${AMARELO}Bom dia!"
	
elif [ "$HOUR" -ge 12 -a "$HOUR" -lt 18 ]
then
	echo -e "${ROXO}Boa tarde!"
else
	echo -e "${CIANO}Boa noite!"
fi

#-----------------------------
#Definindo AM ou PM

echo ""
if [ "$HOUR" -ge 12 -a "$MIN" -ge 1 ] 
then
	AMPM=PM
else
	AMPM=AM
fi

#------------------------------
# Exibindo a hora 

HOUR=$(expr "$HOUR" - 12)
echo " A hora atual é: "$HOUR":"$MIN" "$AMPM" " 
