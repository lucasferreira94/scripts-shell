#!/usr/bin/env bash
#
# DataFuncao - Script determina o formato da data (BR ou US)
#
# Autor: Lucas Ferreira
# Manutenção: Lucas Ferreira
# e-mail: lucas_sferreira94@hotmail.com
# ---------------------------------------------------------------------------------- #
# Modo de uso ./DataFuncao.sh -f 08131981
#
# Este exemplo pode ser usado para verificar qual é o código de retorno de acordo
# com o formato da data passada pelo usuário
#
# Para mais detalhes do funcionamento, verificar: ./DataFuncao.sh --help
# ---------------------------------------------------------------------------------- #
# Detalhes das funções:
# helper ()       --> Exibe o menu de ajuda ao usuário
# databrus ()     --> responsável em verificar o formato da data e fazer o retun code
#                     de acordo com este formato dado
# changedt ()     --> irá mudar o formato de BR para US ou de US para BR
# barinclude ()   --> separa a data por '/' caso não tenha sido informada pelo usuário
# extendformat () --> mostra a data passada em formato extenso
# ---------------------------------------------------------------------------------- #
# Histórico:
#
# v1.0 05/08/2020
# ---------------------------------------------------------------------------------- #
# Testado em: 05/08/2020
#	bash 5.0.17
# kernel 5.4.0-42-generic
# Ubuntu 20.04 LTS
# ---------------------------------------------------------------------------------- #

clear
# -------------------------------------- VARIÁVEIS --------------------------------- #
DATA=$(echo $2 |tr -d /)
NUM1=$(echo $DATA |cut -c1-2)
NUM2=$(echo $DATA |cut -c3-4)
ANO=$(echo $DATA |cut -c5-8)
# ---------------------------------------------------------------------------------- #

# --------------------------------------- FUNCOES ---------------------------------- #
function helper () {
    echo "Uso $0 OPÇÂO DATA"

    echo
    echo "DATA nos formatos DDMMYYY ou MMDDYYYY, com ou sem /"
    echo

    echo "Opções:
    -f = Retorna 0 para BR, 1 para US, 2 quando impossível determinar e 3 inválido
    -i = Inverte formato BR para US e US para BR. Inclui as Barras
    -b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981
    -e = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1981"
    echo
}

function databrus () {

	if   [ $NUM1 -le 12 -a $NUM2 -gt 12 ]; then #Data no formato US?
		return 1
	elif [ $NUM1 -gt 12 -a $NUM2 -le 12 ]; then #Data no formato BR?
		return 0
	elif [ $NUM1 -le 12 -a $NUM2 -le 12 ]; then #Data impossível de determinar o formato
		return 2
	else
		return 3                                  #Formato inválido
	fi
}

function changedt () {
	databrus $1
	local CODE_RETURN=$?                        #Qual return code da função databrus?

	if [ $CODE_RETURN -ne 3 ]; then             #Código de retorno é válido?
		echo $NUM2/$NUM1/$ANO
	else
		echo "Não foi possível realizar a mudança"
		exit 1
	fi
}

function barinclude () {
	databrus $1
	local CODE_RETURN=$?

	echo $NUM1/$NUM2/$ANO
}

function extendformat () {
# =================== DETERMINA O FORMATO =================== #
	databrus $1
	local FORMAT_RETURN=$?

	case $FORMAT_RETURN in                     #Determina qual formato será usado

		0) DIA=$NUM1 		                         #Formato BR
		   MES=$NUM2		;;

		1) DIA=$NUM2		                         #Formato US
		   MES=$NUM1		;;

		2) echo "

		   Impossível determinar o padrão da data
		   1 - BR (DD/MM/YYYY)
		   2 - US (MM/DD/YYYY)"
		  echo
		  read -p "Informe o formato 1 ou 2: " PADRAO

		   if [ $PADRAO -eq 1 ]; then
				local DIA=$NUM1
				local MES=$NUM2
		   else
				local DIA=$NUM2
				local MES=$NUM1
		   fi				;;

	    3) exit 1			;;
	esac

# =================== INDICA MÊS =================== #
	case $MES in

		01) MES="Janeiro"   ;;

		02) MES="Fevereiro" ;;

		03) MES="Março"	    ;;

		04) MES="Abril"	    ;;

		05) MES="Maio"	    ;;

		06) MES="Junho"	    ;;

		07) MES="Julho"	    ;;

		08) MES="Agosto"    ;;

		09) MES="Setembro"  ;;

		10) MES="Outubro"   ;;

		11) MES="Novembro"  ;;

		12) MES="Dezembro"  ;;
	esac
# ===================
echo "$DIA de $MES de $ANO"
}
# ------------------------------------------------------------------------------------- #

# -------------------------------------- EXECUÇAO ------------------------------------- #
case "$1" in

	"--help") helper	   	                                 ;;
	    "-f") databrus
	 	      echo $?    	                                   ;;
      "-i") changedt   	                                 ;;
		  "-b") barinclude 	                                 ;;
		  "-e") extendformat                                 ;;
         *) echo "Opção inválida. Favor utilizar --help" ;;
esac
# ------------------------------------------------------------------------------------- #
