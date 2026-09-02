#!/bin/bash
clear

echo "Faça um script que solicite o nome de um arquivo e apresente:"
echo "- quantidade de linhas;"
echo "- quantidade de palavras;"
echo "- quantidade de caracteres."

read -p "Digite o nome do arquivo: " arquivo

if [ -e $arquivo ] ; then
	echo "Arquivo: $arquivo"
	echo "Quantidade de Linhas:       $(wc -l $arquivo | cut -f 1 -d " ")"
	echo "Quantidade de Palavras:     $(wc -w $arquivo | cut -f 1 -d " ")"
	echo "Quantidade de Caractereres: $(wc -m $arquivo | cut -f 1 -d " ")"
	else
		echo "Arquivo $arquivo inexistente."
fi
