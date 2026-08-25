#!/bin/bash

clear

read -p "Informe o numero 1: " n1
read -p "Informe o numero 2: " n2

echo "1. Soma\n
2. Subtração\n
3. Multiplicação\n
4. Divisão\n
5. Sair\n"

read -p "Seleciona a opção: " op

case $op in 
	1)
		res=$(expr $n1 + $n2)
		;;
	2)
		res=$(expr $n1 - $n2)
		;;
	3)
		res=$(( $n1 * $n2))
		;;
	4)
		res=$(( $n1 / $n2))
		;;
	*)
		echo "Programa encerrado"
		;;
esac
echo "Resultado = $res"


	
