#!/usr/bin/env bash
#
# relatorio_usuario.sh - Traz algumas informações do usuário do sistema
#
# Autor: Lucas Ferreira
# Manutenção: Lucas Ferreira
#
# ----------------------------------------------------------------------------------- #
# Forma de utilização:
#
#   	$ ./relatorio_maquina.sh usuario
#	Neste exemplo o script será executado e retornará as respectivas informações
# ------------------------------------------------------------------------------------ #
# Histórico:
#
# v1.1 14/11/2020 Autor da mudança: Lucas Ferreira
#	- Adicionado novo cabeçalho
#	- Informações reorganizadas
#	- Adicionado cores para as resultados
# ------------------------------------------------------------------------------------ #
# Testado em:
#	5.0.17(1)-release (x86_64-pc-linux-gnu)
# --------------------------- TESTES ------------------------------------------------- #
ls /home/$1 > /dev/null 2>&1 || { echo "Usuário inexistente" ; exit 1; }

[ $# -eq 0 ] && echo "Por favor informar o nome de um usuário" && exit 1

#----------------------------- VARIÁVEIS --------------------------------------------- #
INFOUSR=$(grep $1 /etc/passwd |awk -F : '{print $3}')
NAMECOMP=$(grep $1 /etc/passwd |awk -F : '{print $5}' |cut -d "," -f1 )
HOMEUSAGE=$(du -sh /home/$1 |cut -f1)
LASTLOG=$(lastlog -u $1)
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
AMARELO="\033[33;1m"
#-------------------------------------------------------------------------------------- #

clear
echo -e "
================= Relatório do usuário $1 ====================

"${VERDE}UID:" "${VERMELHO}$INFOUSR"

"${VERDE}Nome ou Descrição:" "${VERMELHO}$NAMECOMP"

"${VERDE}Total usado no /home/$1:" "${VERMELHO}$HOMEUSAGE"
"
 echo -e ""${VERDE}Último login:"

${AMARELO}$LASTLOG
"
