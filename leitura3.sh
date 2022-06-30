#!/bin/bash

#INICIO
while true
do
echo -e "\n-----MENU-----"
echo -e "(1). Adicionar/Remover máquinas;"
echo -e "(2). Fazer backup simultâneo;"
echo -e "(3). Listar backups;"
echo -e "(4). Verificar log"
echo -e "(5). Manter os backups mais recentes;"
echo -e "(6). Sair;"
echo -e "\n"
read -p "Digite uma opção: " option
case $option in
	1)
		echo -e "Adicione uma nova linha no formato das anteriores ou remova alguma: "
		read -p "Pressione Enter para continua com a edição: " press
		nano file.txt
		;;
	2)
		tiempo1=$(date +'%d-%m-%Y~%T')
		for l in file.txt
		do
			read ipv4 directory username password destiny <<< $(cat file.txt | tr ':' ' ')
			sshpass -p "$password" scp -r $username@$ipv4:$directory $destiny$ipv4~$tiempo1
			sleep 1
			echo -e "\nExecutando backup..."
			lszao=$(ls $destiny | ls -1 -d */ | grep "$ipv4")
			for i in $lszao
			do
				tar -cf $ipv4~$RANDOM.tar.gz $destiny$lszao
				rm -r $destiny$lszao
			done
		done
		echo -e "Backup simultâneo finalizado!\n"
		sleep 1
		echo -e "\n*******************************\n"
		;;
	3)
		echo -e "Listando todos os backups..."
		sleep 1
		for l in file.txt
		do
			read ipv4 directory username password destiny <<< $(cat file.txt | tr ':' ' ')
			ls $destiny | grep "$ipv4"
			echo -e "\n"
		done
		echo -e "\n"
		;;
	4)
		echo -e "Listando log: \n"
		cat log.txt
		echo -e "\n"
		;;
	5)
                for l in file.txt
                do
                        read ipv4 directory username password destiny <<< $(cat file.txt | tr ':' ' ')
                        #ls $destiny | grep "$ipv4" |find $destiny ! -mmin -1 | xargs rm f 
                        echo -e "\n"
                done
		;;
	6)
		break
		;;
	*)
esac
done
#FIM
