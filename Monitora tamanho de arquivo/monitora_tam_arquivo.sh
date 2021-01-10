#!/usr/bin/env bash
#
# monitora_tam_arquivo.sh - 
# O script irá criar um arquivo de texto com uma palavra especificada que será escrita repetidamente
# até que o arquivo tenha um determinado tamanho também passado como parametro pelo usuário
# 
# Autor: Lucas Ferreira
# Manutenção: Lucas Ferreira
#
# ---------------------------------------------------------------------------------------------- #
#
# Exemplo de uso:
#     $ ./monitora_tam_arquivo.sh
# 
# Neste exemplo o script irá solicitar o nome do arquivo, a palavra que este arquivo conterá 
# e o tamanho em bytes que este arquivo atingirá
#  
# ---------------------------------------------------------------------------------------------- #
# Histórico:
#
# v1.0 30/11/2020
#
# v1.1 10/01/2021:
#   - Adicionado um novo cabeçalho
#   - Alterado o a sintaxe para diminuição de quantidade de comandos e linhas
# ---------------------------------------------------------------------------------------------- #
# Testado em:
# bash 5.0.17(1)-release (x86_64-pc-linux-gnu)
# ---------------------------------------------------------------------------------------------- #
clear

read -p "Qual o nome do arquivo a ser criado: " ARQUIVO
read -p "Quais caracteres devem ser preenchidos: " WORDS
read -p "Qual tamanho máximo em bytes o arquivo deve conter: " SIZE

echo

PCTG_EXIB=0

while [[ $(stat --printf=%s "$ARQUIVO") -lt $SIZE ]] #Qual é o tamanho do arquivo?
do
	echo -n "$WORDS" >> "$ARQUIVO"
	
	TAM_ATUAL=$(stat --printf=%s "$ARQUIVO") #Qual é o tamanho atual do arquivo?

	PCTG=$(expr $TAM_ATUAL \* 100 / $SIZE) #Qual a porcentagem do arquivo?

	if [ $(expr $PCTG % 10) -eq 0 -a $PCTG_EXIB -ne $PCTG ] #Porcetagem igual a 0? porcetagem exibida na tela não é igual a 100% ?
	then	
		echo "Concluído: $PCTG % - Tamanho do arquivo: $TAM_ATUAL"
		PCTG_EXIB=$PCTG 
	fi	
done

echo
echo "Arquivo criado!"
echo
ls -l | grep "$ARQUIVO"	

