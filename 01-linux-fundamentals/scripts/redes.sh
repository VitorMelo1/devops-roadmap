#!/bin/bash
# =============================================================================
# redes.sh — Aula 08: Diagnóstico de Rede no Linux
# =============================================================================
# O que você vai aprender:
#   - ping       testa se um host está acessível
#   - nslookup   resolve um domínio para IP (consulta DNS)
#   - ifconfig   lista as interfaces de rede e seus IPs
#   - netstat    mostra as portas abertas no sistema
#
# Para executar:
#   chmod +x redes.sh
#   ./redes.sh
#
# Pré-requisito: sudo apt-get install net-tools   (para ifconfig e netstat)
# =============================================================================

echo ""
echo "============================================"
echo "  Diagnóstico de Rede — Aula 08"
echo "  $(date)"
echo "============================================"
echo ""

# ─── ping: testa conectividade ───────────────────────────────────────────────
# ping envia pacotes ICMP para o destino e espera resposta.
# Se responder: o host está acessível.
# Se não responder: pode ser problema de rede, DNS ou firewall.
#
# No curso: ping google.com (roda infinito — Ctrl+C para parar)
# No script usamos -c 3 para limitar a 3 pacotes e não travar o terminal.

echo "--- ping: testando conexão com google.com ---"
echo "Comando: ping google.com   (no terminal use Ctrl+C para parar)"
echo ""
ping -c 3 google.com
echo ""

# ─── nslookup: resolve nome para IP (DNS) ────────────────────────────────────
# nslookup pergunta ao servidor DNS: qual é o IP deste domínio?
# Útil para confirmar se o DNS está funcionando corretamente.
#
# Fluxo: você digita 'alura.com.br' → nslookup devolve o IP → ping usa o IP

echo "--- nslookup: descobrindo o IP de google.com ---"
echo "Comando: nslookup google.com"
echo ""
nslookup google.com
echo ""

# ─── ifconfig: interfaces de rede ────────────────────────────────────────────
# ifconfig lista todas as interfaces de rede do computador:
#   - eth0 / ens33  → placa de rede cabeada
#   - wlan0          → Wi-Fi
#   - lo             → loopback (127.0.0.1 — comunicação interna)
#
# O IP que aparece em 'inet' é o IP local da máquina.

echo "--- ifconfig: interfaces de rede ativas ---"
echo "Comando: ifconfig"
echo ""
ifconfig
echo ""

# ─── netstat -ntpl: portas abertas (serviços rodando) ────────────────────────
# netstat mostra as conexões de rede ativas no sistema.
# -n = mostra números (não resolve nomes)
# -t = somente TCP
# -p = mostra qual processo está usando a porta
# -l = somente os que estão escutando (listening)
#
# Exemplo de saída útil:
#   0.0.0.0:22   LISTEN  sshd    → servidor SSH ativo
#   0.0.0.0:80   LISTEN  nginx   → servidor web ativo

echo "--- netstat: portas abertas no sistema ---"
echo "Comando: netstat -ntpl"
echo ""
netstat -ntpl
echo ""

echo "============================================"
echo "  Script concluído!"
echo "============================================"
