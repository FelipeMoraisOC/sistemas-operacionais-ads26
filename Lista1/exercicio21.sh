#!/bin/bash

clear



while true; do
	echo "


	"
	echo "===== GERENCIAMENTO DE PROCESSOS =====
	1 - Listar processos
	2 - Procurar processo
	3 - Encerrar processo
	4 - Sair"

	read -p "Digite sua escolha: " op
	
	clear	
	
	case $op in
		1)
			echo "=====Lista e Processos====="
			ps -ef
			;;
		2)
			echo "º| Procurar processos..."
			read -p "Digite nome de processo a ser procurado: " processo
			resultado=$(ps -ef | grep "$processo")
			if [ -z "$resultado" ] ; then
				echo "Processo $processo, não encontrado."
				else
				echo "$resultado"
			fi
			;;
		3)
			
			echo "Matar )xxxxx[;;;;;;;;;> Processo"
			read -p "Digite o PID do processo a ser destruído: " pid
			resultado=$(ps -ef | grep "$pid")
			if [ -z resultado ] ; then 
				echo "Processo $pid não encontrado"
				else
					echo ":::PROCESSO:::"
					echo "$resultado"
					read -p "Realmente deseja matar o processo $pid? [s/n] " escolha
					if [[ "$escolha" == "s" ]] ; then
						kill $pid
						echo "Processo finalizado com sucesso!" 
						else
							echo "Execução cancelada."
					fi
			fi
			;;
		*)
			echo "Programa encerrado."
			break
			;;
			
	esac 	

done
