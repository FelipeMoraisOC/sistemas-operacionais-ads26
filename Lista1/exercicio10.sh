#!/bin/bash

clear
echo "Faça um script que solicite o nome de um usuário e apresente as seguintes informações"
echo "Nome do usuário;
Diretório de trabalho (home);
Espaço utilizado no disco pelo diretório do usuário.
Utilize informações disponíveis no sistema, como /etc/passwd, e os comandos conhecidos em aula.
Desafio: caso o usuário informado não exista, apresente uma mensagem adequada.
"

read -p "Nome do usuário: " nome


if grep -q  "^$nome" /etc/passwd ; then
		dir_home=$(grep  "^$nome" /etc/passwd | cut -d':' -f6)
		
		echo "Usuário encontrado com sucesso: $nome" 
		echo "Diretório de trabalho (home): $dir_home"
		
		
	else 
		echo "Usuário $nome inexistente"
fi





