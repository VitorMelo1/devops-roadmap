#!/bin/bash
# =============================================================================
# hello-linux.sh — Aula 06: Variáveis e Substituição de Comandos
# =============================================================================
# O que você vai aprender:
#   - O que é o shebang (#!/bin/bash)
#   - Como criar e usar variáveis
#   - Como capturar a saída de um comando com $(comando)
#   - Como usar echo, date, pwd e ls
#
# Para executar:
#   chmod +x hello-linux.sh    ← dá permissão de execução (Aula 04)
#   ./hello-linux.sh           ← executa com caminho relativo
# =============================================================================

# ─── SHEBANG ─────────────────────────────────────────────────────────────────
# A linha #!/bin/bash no topo diz ao sistema qual interpretador usar.
# Sem ela, o sistema não sabe que este arquivo é um script bash.

# ─── VARIÁVEIS ───────────────────────────────────────────────────────────────
# Variável guarda um valor para reutilizar em qualquer parte do script.
# Regra: sem espaços ao redor do = e sem $ na hora de criar.
NOME="Vitor"
CURSO="Linux Fundamentos"

echo ""
echo "============================================"
echo "  Hello, Linux!"
echo "============================================"
echo ""

echo "--- Variáveis ---"
echo "NOME  : $NOME"     # $ antes do nome lê o valor da variável
echo "CURSO : $CURSO"
echo ""

# ─── SUBSTITUIÇÃO DE COMANDOS $() ────────────────────────────────────────────
# $(comando) executa o comando e captura a saída como valor.
# Qualquer comando pode ser usado: date, pwd, ls, cat...
DATA=$(date)     # executa `date` e guarda o resultado na variável DATA
PASTA=$(pwd)     # pwd = print working directory — mostra onde você está (Aula 03)

echo "--- Substituição de Comandos ---"
echo "Data atual : $DATA"
echo "Pasta atual: $PASTA"
echo ""

# ─── ls: listar arquivos da pasta ────────────────────────────────────────────
# ls -las mostra: permissões, tamanho, dono, data e nome do arquivo (Aula 03)
echo "--- Conteúdo da pasta atual (ls -las) ---"
ls -las
echo ""

echo "============================================"
echo "  Script concluído!"
echo "============================================"
