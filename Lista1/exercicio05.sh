#!/bin/bash

clear

read -p "Digite um nome de usuário: " usuario

if grep -q "^$usuario" /etc/passwd  ; then
	echo "Usuario $usuario existe!"
	else
	echo "Usuario $usuario inexistente."
fi
