#!/usr/bin/env bash
#
# backup_home.sh  
#
# Autor: Lucas Ferreira
# Manutenção: Lucas Ferreira
#
# ---------------------------------------------------------------------------------------------- #
#
# Exemplo de uso:
#     $ ./backup_home.sh
# Neste exemplo o script será executado e irá iniciar o backup do diretório do usuário no /home 
# O arquivo estará em formato compactado
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
#
# -------------------------------------- VARIÁVEIS --------------------------------------------- #
DIRBKP=$HOME/Backup                                     #Diretório destino do backup
ARQDIR=$(find $DIRBKP -ctime -7 -name backup_home\*tgz) #Arquivo de backup
ARQBKP="backup_home_"$(date +%Y%m%d%H%M)".tgz"          #Nome que será dado ao arquivo 
# ------------------------------------- EXECUÇÃO ------------------------------------------------ #

#--Criação do diretório
if [ -d "$DIRBKP" ]
then
	echo "Diretório Backup já existe"
	echo ""
	find $DIRBKP
	echo ""
else	 	
	echo "Criando diretório para Backup..."
	sleep 2 
	mkdir -p "$DIRBKP"
	echo ""
	echo "Diretório de Backup criado!"
	find $DIRBKP
	echo ""
fi
#-- Criação do arquivo
if [ "$ARQDIR" ]
then
	echo "Já foi criado um backup do diretório nos últimos 7 dias"
	echo -n "Deseja continuar (s/n)?"	
	read -n1 CONF
	
	if [ $CONF = n -o $CONF = N -o $CONF = "" ]
	then
		echo ""
		echo "Backup abortado!"
		exit 1

	elif [ $CONF = s -o $CONF = S ]
	then
		echo ""
		echo "Será criado um novo arquivo"
		echo ""
	else
		echo "Opção inválida"
		exit 1
	fi

fi 

echo "Criando arquivo..."
sleep 2

# -- OBSERVAÇÃO
# Abaixo temos o destino onde será criado o arquivo;
# exclude: quais diretórios serão ignorados para realização do backup. Observação: deve mencionar o $DIRBKP para ele não criar um backup do backup
# "$HOME" qual diretório especificado será feito o backup 
# > /dev/null para onde direcionar a mensagem assim que terminar

tar zcvpf $DIRBKP/$ARQBKP --exclude="$DIRBKP" --exclude="$HOME/snap" --exclude="$HOME/VirtualBox VMs" "$HOME"  > /dev/null

echo "Backup criado com sucesso!"
echo
ls -l $DIRBKP
