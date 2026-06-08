#!/bin/bash
# =============================================================================
# pipes-demo.sh — Aula 06: Pipes e Redirecionadores
# =============================================================================
# O que você vai aprender:
#   - pipe  |   conecta a saída de um comando à entrada do próximo
#   - >         redireciona a saída para um arquivo (sobrescreve)
#   - >>        redireciona a saída para um arquivo (acumula)
#   - cat       lê o conteúdo de um arquivo
#   - grep -n   filtra linhas que contêm um texto, mostrando o número
#   - sort      ordena as linhas alfabeticamente
#
# Para executar:
#   chmod +x pipes-demo.sh
#   ./pipes-demo.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Pipes e Redirecionadores — Aula 06"
echo "============================================"
echo ""

# ─── PIPE | ──────────────────────────────────────────────────────────────────
# pipe | conecta comandos em sequência:
# a saída do primeiro vira a entrada do segundo, e assim por diante.
# É como uma correia de produção — cada comando transforma o dado.

echo "--- Pipeline exato do curso ---"
echo "Comando: cat /etc/passwd | grep -n root | sort"
echo ""

# Passo a passo do que acontece:
#   1. cat /etc/passwd   → lê o arquivo inteiro
#   2. grep -n root      → filtra só as linhas que contêm 'root'
#                          -n mostra o número da linha
#   3. sort              → ordena o resultado em ordem alfabética
cat /etc/passwd | grep -n root | sort

echo ""
echo "Outros comandos úteis em pipelines:"
echo "  wc -l  → conta quantas linhas a saída tem"
echo "  sort   → ordena"
echo ""
echo "Exemplo: cat /etc/passwd | wc -l"
cat /etc/passwd | wc -l
echo "(número de usuários no sistema)"
echo ""

# ─── REDIRECIONADOR > (sobrescreve) ──────────────────────────────────────────
# > redireciona a saída para um arquivo.
# ATENÇÃO: apaga o conteúdo anterior toda vez que roda.

ARQUIVO="/tmp/meu-log.txt"

echo "--- Redirecionador > (sobrescreve) ---"
echo "primeira linha"  > $ARQUIVO
echo "segunda linha"   > $ARQUIVO   # esta linha apagou a anterior!
echo "Conteúdo do arquivo após dois > seguidos:"
cat $ARQUIVO                         # mostra só: 'segunda linha'
echo ""

# ─── REDIRECIONADOR >> (acumula) ─────────────────────────────────────────────
# >> acumula ao final do arquivo sem apagar o que já existe.
# Ideal para logs — cada execução adiciona uma nova linha.

echo "--- Redirecionador >> (acumula) ---"
echo "$(date) — execução 1" >> $ARQUIVO
echo "$(date) — execução 2" >> $ARQUIVO
echo "Conteúdo do arquivo após dois >> seguidos:"
cat $ARQUIVO                         # mostra: segunda linha + as duas datas
echo ""

echo "Execute este script duas vezes e veja o arquivo crescer:"
echo "  ./pipes-demo.sh"
echo "  cat $ARQUIVO"
echo ""

echo "============================================"
echo "  Script concluído!"
echo "============================================"
