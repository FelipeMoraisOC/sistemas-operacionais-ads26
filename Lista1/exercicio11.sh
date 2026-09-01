#!/bin/bash

clear

echo "Faça um script que apresente os usuários atualmente conectados ao sistema"

qtd_users=$(who | wc -l)
echo "Escolha uma opção"
echo "Listar Usuário Logados [1]"
echo "Verificar mais informações de usuário [2]:"
read -p "Digite 1 ou 2:" escolha
if [ "$escolha" -eq 1 ] ; then
	echo "Quantidade de usuários logados: $qtd_users"
	who
	else 
		who
		read -p "Selecione o usuário que deseja saber mais informações: " esc_user
		nome=$(who | head -n "$esc_user" | tail -n 1 | cut -d' ' -f1)
		if grep -q  "^$nome" /etc/passwd ; then
		dir_home=$(grep  "^$nome" /etc/passwd | cut -d':' -f6)
		
		echo "Diretório de trabalho (home): $dir_home"
		
		
		else 
			echo "Usuário $nome inexistente"
	fi
fi
