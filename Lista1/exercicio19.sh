#!/bin/bash

clear



while true; do
	echo "===== INFORMAÇÕES DO SISTEMA =====
	1 - Data atual
	2 - Versão do kernel
	3 - Calendário
	4 - Tempo de funcionamento
	5 - Usuários conectados
	6 - Processos em execução
	7 - Sair"

	read -p "Digite a escolha: " op
	clear
	
	case $op in
		1)
			echo "Data atual: $(date)"
			;;
		2)
			echo "Versão do Kernel: $(uname -r)"
			;;
		3)
			echo "Calendário: "
			echo "$(ncal)"
			;;
		4)
			echo "Tempo de funcionamento: $(uptime)"
			;;
		5) 
			echo "Usuários conectados: "
			echo "$(who -a)"
			;;
		6)
			echo "Processos em execução: "
			echo "$(ps -ef)"
			;;
		*)
			echo "Programa Encerrado."
			break
			;;
	esac
	echo "
	
	
	"
done
