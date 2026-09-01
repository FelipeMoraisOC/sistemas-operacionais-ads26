#!/bin/bash
clear

echo "Utilize o comando chmod para alterar as permissões."
read -p "Digite o nome do arquivo que deseja alterar as permissões: " arq

if [ -e $arq ] ; then
	echo "Permissão atual do $arq -> $(ls -l $arq)"
	echo "======MENU======"
	echo "Aplicar permissão 644: Opção [1]"
	echo "Aplicar permissão 755: Opção [2]"
	echo "Aplicar permissão 700: Opção [3]"
	echo "Aplicar permissão Costumizada: Opção [4]"
	read -p "Digite o número da escolha: " op
	case $op in 
		1)
			chmod 644 $arq
			;;
		2)
			chmod 755 $arq
			;;
		3)
			chmod 700 $arq
			;;
		4)
			read -p "Digite os código de permissão: " cod_perm
			chmod $cod_perm $arq
			;;
		*)
			echo "Opção não existente, saindo sem alterações"
			;;
	esac
	echo "Permissão atual do arquivo:"
	echo "$arq -> $(ls -l $arq)" 
	else
		echo "Arquivo $arq inexistente."
fi
