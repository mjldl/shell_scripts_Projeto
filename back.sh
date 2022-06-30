#!/bin/bash

source functions #IMPORT das funcoes

#INICIO

while true
do
	MENU
	read -p "Digite uma opção: " option
	case $option in
		1)
			ADDREM
			;;
		2)
			BCKP
			;;
		3)
			LIST
			;;
		4)
			LOG
			;;
		5)
	                LIST
			DIFF
			;;
		6)
	               MEMORIA
			;;
		7)
	                break
			;;
		*)
	esac
done

#FIM
