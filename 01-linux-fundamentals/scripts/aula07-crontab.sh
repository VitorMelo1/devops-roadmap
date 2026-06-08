#!/bin/bash
# =============================================================================
# aula07-crontab.sh — Aula 07: CronTab e Agendamento de Tarefas
# =============================================================================
# O que você vai aprender:
#   - crontab -l  → listar tarefas agendadas
#   - crontab -e  → editar tarefas agendadas
#   - A sintaxe dos 5 campos do crontab
#   - Casos de uso reais: backup, relatório, limpeza
#
# Para executar:
#   chmod +x aula07-crontab.sh
#   ./aula07-crontab.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Aula 07 — CronTab e Agendamento"
echo "============================================"
echo ""

# ─── O QUE É O CRONTAB? ──────────────────────────────────────────────────────
# crontab é o agendador de tarefas do Linux.
# Você define: em que horário + qual comando deve rodar automaticamente.
# Ideal para: backups diários, relatórios, limpeza de /tmp, monitoramento.

echo "--- O que é o crontab? ---"
echo ""
echo "  crontab = agenda de tarefas automáticas do Linux"
echo "  Funciona em background — roda mesmo sem você estar logado."
echo ""

# ─── SINTAXE DOS 5 CAMPOS ────────────────────────────────────────────────────

echo "--- Sintaxe do crontab ---"
echo ""
echo "  ┌─────────── minuto    (0–59)"
echo "  │ ┌───────── hora      (0–23)"
echo "  │ │ ┌─────── dia do mês (1–31)"
echo "  │ │ │ ┌───── mês       (1–12)"
echo "  │ │ │ │ ┌─── dia da semana (0=dom, 1=seg ... 6=sab)"
echo "  │ │ │ │ │"
echo "  * * * * *   /caminho/para/script.sh"
echo ""
echo "  Símbolos:"
echo "    *     → todos os valores"
echo "    */5   → a cada 5 unidades"
echo "    1-5   → intervalo (seg a sex)"
echo "    0,30  → valores específicos (meia-noite e meio-dia)"
echo ""

# ─── EXEMPLOS DO CURSO ───────────────────────────────────────────────────────

echo "--- Exemplos do curso ---"
echo ""
echo "  Todo dia às 02:00 — backup:"
echo "    0 2 * * *   /usr/local/bin/backup.sh"
echo ""
echo "  Segunda a sexta às 08:30 — relatório:"
echo "    30 8 * * 1-5   /usr/bin/echo 'Bom dia' >> /tmp/cron.txt"
echo ""
echo "  A cada 5 minutos:"
echo "    */5 * * * *   /home/vitor/script_5min.sh"
echo ""
echo "  A cada 5 horas:"
echo "    0 */5 * * *   /home/vitor/script_5h.sh"
echo ""

# ─── crontab -l: VER TAREFAS AGENDADAS ───────────────────────────────────────
# crontab -l lista todas as tarefas do usuário atual.

echo "--- crontab -l: tarefas agendadas do usuário atual ---"
echo "Comando: crontab -l"
echo ""
crontab -l
echo ""

# ─── COMO EDITAR ─────────────────────────────────────────────────────────────
# crontab -e abre o editor para adicionar/remover tarefas.
# Não vamos abrir o editor aqui, mas o uso é simples:

echo "--- Como adicionar uma tarefa ---"
echo ""
echo "  1. Digite: crontab -e"
echo "  2. Adicione a linha no formato: minuto hora dia mês semana /caminho/script.sh"
echo "  3. Salve e feche (Ctrl+X no nano, :wq no vim)"
echo ""
echo "  Exemplo para rodar log-watcher.sh todo dia às 08:00:"
echo "    0 8 * * * /caminho/para/log-watcher.sh >> /tmp/log-diario.txt"
echo ""

echo "============================================"
echo "  Próxima aula: Redes (Aula 08)"
echo "  Execute: ./redes.sh"
echo "============================================"
