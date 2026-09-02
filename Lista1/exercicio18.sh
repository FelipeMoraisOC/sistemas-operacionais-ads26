#!/bin/bash
clear

echo "Faça um script que exiba ao usuário:
1. Data atual;
2. Versão do kernel;
3. Calendário do mês atual;
4. Tempo de funcionamento do sistema."

read -p "Digite sua escolha: " escolha
case $escolha in
	1) 
		echo "Data atual: $(date)"
		;;
	2)
		echo "Versão do Kernel: $(uname -r)"
		;;
	3) 
		echo "Calendário do mês atual:" 
		echo "$(ncal)"
		;;
	4)
		echo "Tempo de funcionamento do sistema: $(uptime)"
		;;
	*)
		echo "Nenhuma opção viável selecionada"
		;;
esac
