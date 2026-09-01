#!/bin/bash
clear

echo "Faça um script que apresente ao usuário os processos atualmente em execução no sistema."
echo "Utilize: ps aux ou ps -ef"
echo "O script deve apresentar uma mensagem antes da listagem explicando o que está sendo exibido."

echo "=========================================================================="
echo "Abaixo está a lista de todos os processos atualmente em execução no sistema."
echo "As colunas mostram o dono do processo (USER), o identificador (PID), "
echo "o uso de CPU e Memória, e o comando que iniciou o processo (COMMAND)."
echo "=========================================================================="
echo ""

sleep 2

ps aux
