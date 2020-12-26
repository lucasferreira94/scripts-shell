#!/usr/bin/env bash
#
# calculo_basico.sh - exibe hora atual do sistema com saudações
#
# Autor: Lucas Ferreira
# Manutenção: Lucas Ferreira
#
# ---------------------------------------------------------------------------------------------- #
#
# Exemplo de uso:
#     $ ./calculo_basico.sh
# Neste exemplo o script será executado e pedirá dois números para serem calculados. Após isso,
# o usuário de verá escolher a operação desejada.
# ---------------------------------------------------------------------------------------------- #
# Histórico:
#
# v1.0 30/11/2020
#
# v1.1 26/12/2020:
#   - Adicionado um novo cabeçalho
#   - Alterado o a sintaxe para diminuição de quantidade de comandos e linhas
# ---------------------------------------------------------------------------------------------- #
# Testado em:
# bash 5.0.17(1)-release (x86_64-pc-linux-gnu)

clear
read -p "Informe o primeiro valor a ser calculado: " NUM1
echo
read -p "Informe o segundo valor a ser calculado: " NUM2
echo

if [ ! $NUM1 ] || [ ! $NUM2 ]
then
	echo " Necessário informar dois valores numéricos válidos "
	exit 1
fi

echo -e " Escolha uma das opções abaixo: 

 1) Soma 
 2) Subtração 
 3) Multiplicação 
 4) Divisão 
 q) Sair 
 
 "

read -p " Operação: " OP
echo

case "$OP" in
	1) 
	OPTR="+"                                          ;;
	
	2) 
	OPTR="-"                                          ;;
	
	3)
	if [ "$NUM1" -eq 0 -o "$NUM2" -eq 0 ]; then	
		echo " Este programa não calcula com zeros "
		exit 1;
	fi

	OPTR="*"                                          ;;
	
	4)
	if [ "$NUM1" -eq 0 -o "$NUM2" -eq 0 ]; then
		echo " Não é possível realizar divisão por zero "
		exit 1;
	fi

	if [  $(expr $NUM1 % $NUM2) -ne 0 ]
	then
		echo "Divisão com resto = $(expr $NUM1 % $NUM2)"
	else
		echo " Divisão inteira "
	fi
	
	OPTR="/"                                          ;; 
	
	[Qq])
	echo " Saindo... "
	exit 1                                            ;;

	*)
	echo "Opção inválida"
	exit 1                                          	;;

esac

echo " $NUM1 $OPTR $NUM2 = $(expr "$NUM1" "$OPTR" "$NUM2") "
