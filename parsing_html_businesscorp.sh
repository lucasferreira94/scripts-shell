#!/bin/bash

	echo "====================================================================================================="
	echo "			SCRIPT PARSING HTML BUSINESSCORP"
	echo "====================================================================================================="
	echo "SCRIPT CRIADO INICIALMENTE APENAS PARA REALIZAR A TÉCNICA DE PARSING HTML EM UM SITE DE TESTES       "
	sleep 1

if [ "$1" == "" ]
then 

	echo "-----------------------------------------------------------------------------------------------"																				  			     
	echo "	MODO DE USO: ./SCRIPT.SH WWW.BUSINESSCORP.COM.BR "
	echo "-----------------------------------------------------------------------------------------------"
	exit	
else
	if [ -e index.html ]
	then
		echo "				"
		sleep 2
		echo "O arquivo INDEX.HTML ja existe"
		echo "				"
	else
		echo "				"
		wget www.businesscorp.com.br
	fi

fi

sleep 2
        echo "=============================================================================================="
        echo "                          BUSCANDO OS HOSTS...                                 				"
        echo "=============================================================================================="
        echo "                                                              							    "

        cat index.html | grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > lista.txt
        sleep 3
        cat lista.txt

sleep 1
        echo "                                                                 							      "
        echo "================================================================================================"
        echo "                          RESOLVENDO OS HOSTS...                              				  "
        echo "================================================================================================"
        echo "								       															  "

for i in $(cat lista.txt);do
	host $i  | grep "has address"
done


