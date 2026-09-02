#!/bin/bash
clear

verificar_arquivo() {
	arq="$1"
	if [ -e $arq ] ; then
		return 0
		else
			echo "Arquivo $arquivo inexistente."
	fi
	return 1
}

while true; do
	echo "


	"
	echo "===== GERENCIAMENTO DE ARQUIVOS =====
	1 - Procurar arquivo
	2 - Procurar palavra em arquivo
	3 - Renomear arquivo
	4 - Mover arquivo
	5 - Remover arquivo
	6 - Comparar arquivos
	7 - Sair"
	read -p "Digite sua escoha: " op
	clear
	case $op in
		1) 
			read -p "Digite o arquivo a ser procurado: " arq1
			if verificar_arquivo "$arq1"; then
				find /home/user -name $arq1
			fi
			;;
		2)
			read -p "Digite uma palavra para buscar arquivos: " palavra
			grep -r "$palavra" *
			;;
		3)
			read -p "Digite o nome do arquivo a ser renomeado: " arq3
			read -p "Digite o novo nome: " arq3_rename
			if verificar_arquivo "$arq3"; then
				mv $arq3 $arq3_rename
				ls -l | grep $arq3_rename
			fi
			;;
		4)
			echo "=====Lista de Arquivos====="
			ls -l
			echo "==========================="
			read -p "Digite o nome do arquivo a ser movido: " arq4
			if verificar_arquivo "$arq4"; then
				read -p "Digite o diretório do arquivo a ser movido: " dir4
				if [ -d $dir4 ] ; then
				
					mv $arq4 $dir4
					
					echo "Arquivo movido com sucesso."
					else
						echo "Diretório $dir4, não existe."
				fi
			fi
			;;
		5)
			read "Digite o nome do arquivo para remove-lo" arq5
			if verificar_arquivo "$arq5"; then
				read "Realmente deseja excluir o arquivo? [1 - Sim; 0 - Não]" esc5
				if $esc5; then
					rm $arq5
				fi
			fi
			;;
		6)
			echo "Precisa-se de 2 arquivos para compara-los.."
			read -p "Digite o nome do primeiro arquivo: " arq6_1
			if verificar_arquivo "$arq6_1"; then
				read -p "Digite o nome do segundo arquivo: " arq6_2
				if verificar_arquivo "$arq6_2"; then
					diff -y $arq6_1 $arq6_2
				fi
			fi
			;;
		*)
			echo "Programa Encerrado."
			break
			;;
			
	esac

done
