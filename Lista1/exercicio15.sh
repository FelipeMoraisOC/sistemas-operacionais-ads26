#!/bin/bash

clear

echo "Faça um script que solicite ao usuário o PID (número do processo) e encerre o processo utilizando o
comando kill"

echo "LISTA DE TODOS OS PROCESSOS: "
sleep 1
ps -ef
read -p "Digite o PID: " pid

resultado=$(ps -ef | grep "$pid")
if [ -z resultado ] ; then 
	echo "Processo $pid não encontrado"
	else
		echo ":::PROCESSO:::"
		echo "$resultado"
		read -p "Realmente deseja matar o processo $pid? [s/n] " op
		if [[ "$op" == "s" ]] ; then
			kill $pid
			echo "Processo finalizado com sucesso!" 
			else
				echo "Execução cancelada."
		fi
fi
