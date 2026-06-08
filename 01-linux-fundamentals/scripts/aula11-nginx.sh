#!/bin/bash
# =============================================================================
# aula11-nginx.sh — Aula 11: Lab Final — Servidor Web com Nginx
# =============================================================================
# O que você vai aprender:
#   - systemctl  → gerenciar serviços (iniciar, parar, ver status)
#   - netstat -ntpl → confirmar que a porta 80 está aberta
#   - Como instalar e testar o Nginx (requer sudo)
#
# Para executar:
#   chmod +x aula11-nginx.sh
#   ./aula11-nginx.sh
#
# Pré-requisito: sudo apt-get install nginx
# =============================================================================

echo ""
echo "============================================"
echo "  Aula 11 — Lab Final: Servidor Web Nginx"
echo "============================================"
echo ""

# ─── O QUE É O NGINX? ────────────────────────────────────────────────────────
# Nginx é um servidor web — ele recebe requisições HTTP e responde com HTML.
# É gerenciado pelo systemd (o Init do Linux — Aula 02).

echo "--- O que é o Nginx? ---"
echo ""
echo "  Nginx = servidor web"
echo "  Escuta na porta 80 (HTTP) ou 443 (HTTPS)"
echo "  Gerenciado pelo systemd (systemctl)"
echo ""
echo "  Arquivos importantes:"
echo "    /etc/nginx/nginx.conf        → configuração principal"
echo "    /var/www/html/index.html     → página padrão"
echo "    /var/log/nginx/access.log    → log de acessos"
echo "    /var/log/nginx/error.log     → log de erros"
echo ""

# ─── systemctl: GERENCIAR SERVIÇOS ───────────────────────────────────────────
# systemctl controla os serviços gerenciados pelo systemd (Init — Aula 02).
# Funciona para nginx, ssh, postgresql, gunicorn e qualquer serviço do sistema.

echo "--- systemctl: status do nginx ---"
echo "Comando: systemctl status nginx"
echo ""
systemctl status nginx
echo ""

echo "--- Comandos systemctl do curso ---"
echo ""
echo "  systemctl status nginx    → está rodando? (active = sim)"
echo "  systemctl start nginx     → iniciar o serviço"
echo "  systemctl stop nginx      → parar o serviço"
echo "  systemctl restart nginx   → reiniciar (após mudar config)"
echo "  systemctl enable nginx    → iniciar automaticamente no boot"
echo ""

# ─── netstat -ntpl: CONFIRMAR PORTA ABERTA ───────────────────────────────────
# Depois de instalar o Nginx, netstat confirma que ele está escutando na porta 80.
# 0.0.0.0:80 LISTEN = servidor ativo e acessível (Aula 08)

echo "--- netstat -ntpl: portas abertas (Nginx deve aparecer na 80) ---"
echo "Comando: netstat -ntpl"
echo ""
netstat -ntpl
echo ""

# ─── PASSO A PASSO DO LAB ────────────────────────────────────────────────────
# Este é o lab final do curso — integra tudo que foi aprendido.

echo "--- Passo a passo completo do lab ---"
echo ""
echo "  1. Instalar o Nginx:"
echo "       sudo apt update"
echo "       sudo apt-get install nginx"
echo ""
echo "  2. Verificar se está rodando:"
echo "       systemctl status nginx"
echo ""
echo "  3. Confirmar porta 80 aberta:"
echo "       netstat -ntpl"
echo ""
echo "  4. Testar no terminal:"
echo "       telnet localhost 80"
echo "       GET /"
echo "       # Resposta: HTTP/1.1 200 OK ... Server: nginx/1.24.0"
echo ""
echo "  5. Editar a página padrão:"
echo "       sudo vim /var/www/html/index.nginx-debian.html"
echo ""
echo "  6. Monitorar os logs em tempo real (Aula 10):"
echo "       tail -f /var/log/nginx/access.log"
echo ""

echo "============================================"
echo "  Curso concluído! Você aprendeu:"
echo "  Distros → Boot → FHS → Permissões → Pacotes"
echo "  → Shell Script → Crontab → Redes → Usuários"
echo "  → Logs → Nginx"
echo "============================================"
