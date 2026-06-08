#!/bin/bash
# =============================================================================
# aula02-boot.sh — Aula 02: Processo de Boot do Linux
# =============================================================================
# O que você vai aprender:
#   - O que acontece desde o botão ligar até o login
#   - Cada etapa do boot: BIOS → GRUB → Kernel → Init
#   - Interfaces disponíveis (gráficas e terminal)
#
# Aula teórica — este script usa echo para exibir os conceitos no terminal.
# Para executar:
#   chmod +x aula02-boot.sh
#   ./aula02-boot.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Aula 02 — Processo de Boot do Linux"
echo "============================================"
echo ""

# ─── PROCESSO DE BOOT ────────────────────────────────────────────────────────
# Tudo que acontece entre apertar o botão ligar e aparecer a tela de login.

echo "--- O que acontece quando você liga o computador ---"
echo ""
echo "  Botão ligar"
echo "      ↓"
echo "  BIOS/UEFI  → primeiro software a rodar; executa POST (verifica hardware)"
echo "      ↓"
echo "  GRUB       → boot loader; mostra menu de kernel e aponta o sistema"
echo "      ↓"
echo "  InitRunfs  → mini-Linux temporário; carrega drivers de hardware"
echo "      ↓"
echo "  Kernel     → núcleo do Linux; monta sistema de arquivos"
echo "      ↓"
echo "  Init       → PID 1; inicia todos os serviços do sistema"
echo "      ↓"
echo "  Tela de login"
echo ""

echo "--- Cada componente em detalhe ---"
echo ""
echo "  BIOS/UEFI  → verifica RAM, disco, teclado antes de qualquer coisa (POST)"
echo "  GRUB       → permite escolher qual kernel ou SO iniciar"
echo "  InitRunfs  → carrega os drivers para o kernel entender o hardware"
echo "  Kernel     → gerencia CPU, memória e dispositivos"
echo "  Init (PID 1) → pai de todos os processos; sobe serviços como SSH e Nginx"
echo ""

# ─── INTERFACES DO LINUX ─────────────────────────────────────────────────────

echo "--- Interfaces disponíveis ---"
echo ""
echo "  Modo Gráfico (GUI):"
echo "    KDE         → rica em recursos, alto consumo de CPU/RAM"
echo "    Gnome       → popular, abordagem diferente do KDE"
echo "    XFCE        → leve, ideal para hardware antigo"
echo "    Fluxbox     → minimalista, pouquíssimo consumo"
echo ""
echo "  Modo Terminal:"
echo "    Interface de texto puro"
echo "    Mais prático para servidores, automação e administração"
echo "    É o modo padrão em servidores em cloud (sem GUI)"
echo ""

echo "--- Por que servidores usam modo terminal? ---"
echo ""
echo "  GUI consome RAM e CPU que poderiam ser usados pela aplicação."
echo "  Terminal é suficiente para administrar qualquer sistema."
echo "  Este curso inteiro é feito em modo terminal."
echo ""

echo "============================================"
echo "  Próxima aula: Estrutura de Diretórios (Aula 03)"
echo "============================================"
