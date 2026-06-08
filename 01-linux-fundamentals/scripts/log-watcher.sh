#!/bin/bash
# =============================================================================
# log-watcher.sh — Aula 10: Segurança e Logs
# =============================================================================
# O que você vai aprender:
#   - Onde ficam os logs no Linux (/var/log)
#   - tail       lê as últimas linhas de um arquivo
#   - tail -f    monitora um arquivo em tempo real (streaming)
#   - journalctl lê os logs centralizados do systemd
#   - grep       busca um padrão de texto dentro de um arquivo
#
# Para executar:
#   chmod +x log-watcher.sh
#   ./log-watcher.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Monitoramento de Logs — Aula 10"
echo "  $(date)"
echo "============================================"
echo ""

# ─── Onde ficam os logs? ─────────────────────────────────────────────────────
# No Linux, todos os logs ficam em /var/log/ (Aula 03 — FHS).
# Cada serviço grava no seu próprio arquivo.
#
#   /var/log/syslog    → log geral do sistema
#   /var/log/auth.log  → logins, sudo, autenticações
#   /var/log/kern.log  → mensagens do kernel
#   /var/log/nginx/    → logs do servidor Nginx (Aula 11)

echo "--- Arquivos de log disponíveis em /var/log ---"
echo "Comando: ls /var/log"
echo ""
ls /var/log
echo ""

# ─── tail: últimas linhas de um arquivo ──────────────────────────────────────
# tail sem flags mostra as últimas 10 linhas do arquivo.
# tail -n 20 mostra as últimas 20 linhas.
# Útil para ver o que aconteceu mais recentemente sem abrir o arquivo inteiro.

echo "--- tail: últimas 10 linhas do auth.log ---"
echo "Comando: tail /var/log/auth.log"
echo ""
tail /var/log/auth.log
echo ""

# ─── journalctl: log centralizado do systemd ─────────────────────────────────
# journalctl lê os eventos de todos os serviços gerenciados pelo systemd.
# É o comando mais completo para investigar o que aconteceu no sistema.
#
# --since "X minutes ago" = eventos a partir de X minutos atrás
# --since today            = tudo que aconteceu hoje
# journalctl -f            = monitoramento em tempo real (como tail -f)

echo "--- journalctl: eventos dos últimos 10 minutos ---"
echo "Comando: journalctl --since '10 minutes ago'"
echo ""
journalctl --since "10 minutes ago"
echo ""

# ─── grep: busca padrão dentro de arquivo ────────────────────────────────────
# grep "texto" arquivo → filtra e mostra só as linhas que contêm o texto.
# Combinado com pipe |, encadeia com tail para ver as últimas ocorrências.
#
# Uso de segurança: detectar tentativas de login com falha

echo "--- grep: tentativas de login com falha ---"
echo "Comando: grep 'Failed password' /var/log/auth.log | tail -n 10"
echo ""
grep "Failed password" /var/log/auth.log | tail -n 10
echo ""

# ─── Fluxo de investigação (do curso) ────────────────────────────────────────
echo "--- Fluxo de investigação de incidente (Aula 10) ---"
echo "  1. journalctl --since 'hora do incidente'  → visão geral"
echo "  2. tail -f /var/log/auth.log               → autenticações suspeitas"
echo "  3. grep 'Failed' /var/log/auth.log         → tentativas falhadas"
echo ""
echo "--- Para monitorar em tempo real ---"
echo "  tail -f /var/log/auth.log    → streaming de auth.log"
echo "  tail -f /var/log/*           → todos os logs ao vivo"
echo "  journalctl -f                → eventos do sistema ao vivo"
echo "  journalctl --since today     → tudo de hoje"
echo ""

echo "============================================"
echo "  Script concluído!"
echo "============================================"
