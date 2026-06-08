#!/bin/bash
# hello-linux.sh — primeiro script: variáveis e substituição de comandos
# Para executar: chmod +x hello-linux.sh && ./hello-linux.sh

# $(comando) executa o comando e captura a saída como valor
DATA=$(date)
USUARIO=$(whoami)
MAQUINA=$(hostname)
PASTA=$(pwd)

# Variável de ambiente do sistema (não precisa capturar, já existe)
echo "========================================"
echo "  Hello, Linux!"
echo "========================================"
echo ""
echo "  Data    : $DATA"
echo "  Usuário : $USUARIO"
echo "  Máquina : $MAQUINA"
echo "  Pasta   : $PASTA"
echo "  Shell   : $SHELL"
echo ""
echo "========================================"
