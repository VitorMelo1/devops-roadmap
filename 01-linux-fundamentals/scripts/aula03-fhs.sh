#!/bin/bash
# =============================================================================
# aula03-fhs.sh — Aula 03: Estrutura de Diretórios (FHS)
# =============================================================================
# O que você vai aprender:
#   - pwd   → onde você está no sistema
#   - ls    → o que tem na pasta
#   - cd    → navegar entre pastas (comando interativo — use no terminal, não em script)
#   - A finalidade de cada diretório do Linux (/etc, /var, /home...)
#
# Para executar:
#   chmod +x aula03-fhs.sh
#   ./aula03-fhs.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Aula 03 — Estrutura de Diretórios (FHS)"
echo "============================================"
echo ""

# ─── FHS: FILESYSTEM HIERARCHY STANDARD ──────────────────────────────────────
# No Linux, cada diretório tem uma finalidade específica.
# Isso é definido pelo FHS — padrão seguido por todas as distros.

echo "--- Mapa de diretórios do Linux ---"
echo ""
echo "  /             → raiz: tudo começa aqui"
echo "  /etc          → configurações do sistema e serviços"
echo "  /var/log      → logs do sistema (usaremos muito na Aula 10)"
echo "  /usr/bin      → programas instalados (python3, vim, nginx...)"
echo "  /bin          → comandos essenciais (ls, cp, mv, rm, cd)"
echo "  /home         → arquivos pessoais dos usuários"
echo "  /tmp          → temporários (limpos no reboot)"
echo "  /dev          → dispositivos (/dev/video0 = câmera, /dev/sda = disco)"
echo "  /proc         → informações do kernel em tempo real"
echo ""

# ─── pwd: ONDE VOCÊ ESTÁ ─────────────────────────────────────────────────────
# pwd = print working directory
# Mostra o caminho completo da pasta em que você está.

# ─── cd: NAVEGAR ENTRE PASTAS ────────────────────────────────────────────────
# cd não é demonstrado aqui porque dentro de um script ele só muda a pasta
# do script, não do terminal do usuário. Use cd diretamente no terminal:
#   cd /etc       → entra na pasta /etc
#   cd /var/log   → entra na pasta de logs
#   cd ~          → volta para o home
#   cd ..         → sobe um nível

echo "--- cd: navegação (use diretamente no terminal) ---"
echo "  cd /etc       → configurações"
echo "  cd /var/log   → logs"
echo "  cd ~          → home do usuário"
echo "  cd ..         → sobe um nível"
echo ""

echo "--- pwd: onde estou agora? ---"
echo "Comando: pwd"
echo ""
pwd
echo ""

# ─── ls: O QUE TEM AQUI ──────────────────────────────────────────────────────
# ls lista os arquivos e pastas do diretório atual.
# -l = formato longo (permissões, dono, tamanho, data)
# -a = mostra arquivos ocultos (começam com .)
# -s = mostra tamanho em blocos
# Combinados: ls -las

echo "--- ls -las: conteúdo detalhado da pasta atual ---"
echo "Comando: ls -las"
echo ""
ls -las
echo ""

# ─── EXPLORANDO DIRETÓRIOS IMPORTANTES ───────────────────────────────────────

echo "--- ls /var/log: onde ficam os logs do sistema ---"
echo "Comando: ls /var/log"
echo ""
ls /var/log
echo ""

echo "============================================"
echo "  Próxima aula: Permissionamento (Aula 04)"
echo "============================================"
