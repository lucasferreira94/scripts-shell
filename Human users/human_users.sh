#!/usr/bin/env bash
#
# human_users.sh - Lista todos usuários do sistema com algumas infromações adicionais
# 
# Autor: Lucas Ferreira
# Manutenção: Lucas Ferreira
#
# ---------------------------------------------------------------------------------------------- #
#
# Exemplo de uso:
#     $ ./human_users.sh
# 
# Neste exemplo o script irá rodar e exibir todos os usuários do sistema com: user, UID, 
# diretório /home e nome do usuário
# ---------------------------------------------------------------------------------------------- #
# Histórico:
#
# v1.0 30/11/2020
#
# v1.1 10/01/2021:
#   - Adicionado um novo cabeçalho
# ---------------------------------------------------------------------------------------------- #
# Testado em:
# bash 5.0.17(1)-release (x86_64-pc-linux-gnu)
# ---------------------------------------------------------------------------------------------- #

clear

# UID de usuário da máquina? 
MIN_UID=$(grep ^UID_MIN /etc/login.defs |tr '\t' ' ' |cut -d " " -f5)
MAX_UID=$(grep ^UID_MAX /etc/login.defs |tr '\t' ' ' |cut -d " " -f4)

# alterando o separador padrão do bash 
OLDIFS=$IFS
IFS=$'\n'

echo -e "USUARIO\t\tUID\tDIR HOME\tNOME OU DESCIÇÃO"

for i in $(cat /etc/passwd)
do
	USERID=$(echo $i |cut -d ":" -f3)
	if [ $USERID -ge $MIN_UID -a $USERID -le $MAX_UID ]
	then
		HUSERS=$(echo $i |cut -d ":" -f1)
		DIRUSER=$(echo $i |cut -d ":" -f6)
		NAMEUSER=$(echo $i |cut -d ":" -f5 |tr -d ',')
		echo -e "$HUSERS\t\t$USERID\t$DIRUSER\t$NAMEUSER"
	fi
done

# Retornar os valores padrões da variável IFS
IFS=$OLDIFS
