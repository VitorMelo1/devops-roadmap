#!/bin/bash
# log-watcher.sh — lê logs recentes do sistema
# Para executar: chmod +x log-watcher.sh && ./log-watcher.sh

echo "========================================"
echo "  Log do Sistema"
echo "  $(date)"
echo "========================================"
echo ""

# journalctl lê os logs do systemd (sistema que gerencia serviços no Linux)
# --since = a partir de quando ler
# --no-pager = mostra tudo de uma vez sem pausar
echo "--- Últimos eventos do sistema (journalctl) ---"
journalctl --since "10 minutes ago" --no-pager
echo ""

# tail -n mostra as últimas N linhas de um arquivo
# /var/log/auth.log registra logins, sudo e autenticações
echo "--- Últimas 15 linhas do auth.log (tail -n) ---"
tail -n 15 /var/log/auth.log
echo ""

# grep busca um padrão de texto dentro de um arquivo
# pipe (|) passa o resultado para o próximo comando
echo "--- Tentativas de login com falha (grep + tail) ---"
grep "Failed password" /var/log/auth.log | tail -n 10
echo ""

# grep também funciona para buscar comandos sudo usados
echo "--- Comandos sudo usados ---"
grep "sudo" /var/log/auth.log | tail -n 10
echo ""

echo "========================================"
echo "  Dica: para monitorar em tempo real use:"
echo "    tail -f /var/log/auth.log"
echo "    journalctl -f"
echo "========================================"
