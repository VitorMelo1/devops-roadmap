#!/bin/bash
# system-monitor.sh — exibe informações do sistema
# Para executar: chmod +x system-monitor.sh && ./system-monitor.sh
#
# Salvar resultado em arquivo (usando >>):
#   ./system-monitor.sh >> /tmp/monitor.log
#
# Agendar com crontab (toda hora):
#   crontab -e
#   0 * * * * /caminho/para/system-monitor.sh >> /tmp/monitor.log

echo "========================================"
echo "  Relatório do Sistema"
echo "  $(date)"
echo "========================================"
echo ""

# df -h mostra o uso de cada disco/partição
# -h = human readable (mostra em GB, MB em vez de bytes)
echo "--- Uso de Disco (df -h) ---"
df -h
echo ""

# free -h mostra quanto de RAM e swap está sendo usado
echo "--- Memória RAM (free -h) ---"
free -h
echo ""

# uptime mostra há quanto tempo o sistema está ligado e a carga de CPU
echo "--- Tempo Ligado (uptime) ---"
uptime
echo ""

# who mostra quais usuários estão logados no momento
echo "--- Usuários Ativos (who) ---"
who
echo ""

# ps aux lista todos os processos em execução
# | pipe passa a saída para o próximo comando
# sort -k3 -r ordena pela coluna 3 (CPU%) em ordem decrescente
# head -6 pega as primeiras 6 linhas (cabeçalho + top 5)
echo "--- Top 5 Processos por CPU ---"
ps aux | sort -k3 -r | head -6
echo ""

echo "========================================"
echo "  Fim do relatório — $(date)"
echo "========================================"
