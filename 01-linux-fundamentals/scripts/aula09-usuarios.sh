#!/bin/bash
# =============================================================================
# aula09-usuarios.sh — Aula 09: Gerenciamento de Usuários e Grupos
# =============================================================================
# O que você vai aprender:
#   - id         → sua identidade no sistema (UID, GID, grupos)
#   - cat /etc/passwd → ver todos os usuários cadastrados
#   - Comandos que precisam de sudo: useradd, passwd, usermod, su
#
# Para executar:
#   chmod +x aula09-usuarios.sh
#   ./aula09-usuarios.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Aula 09 — Usuários e Grupos"
echo "============================================"
echo ""

# ─── MODELO DE IDENTIDADE DO LINUX ───────────────────────────────────────────
# Todo usuário no Linux tem:
#   UID = User ID     (número único do usuário)
#   GID = Group ID    (grupo principal)
#   grupos extras     (sudo, www-data, adm...)

echo "--- Modelo de identidade do Linux ---"
echo ""
echo "  Cada usuário tem:"
echo "    UID   → número único que identifica o usuário"
echo "    GID   → grupo principal do usuário"
echo "    grupos → grupos extras (ex: sudo = permissão de administrador)"
echo ""

# ─── id: QUEM SOU EU? ────────────────────────────────────────────────────────
# id sem argumentos mostra sua identidade atual.
# id <usuario> mostra a identidade de outro usuário.

echo "--- id: minha identidade atual ---"
echo "Comando: id"
echo ""
id
echo ""

# ─── /etc/passwd: ARQUIVO DE USUÁRIOS ────────────────────────────────────────
# /etc/passwd lista todos os usuários do sistema.
# Formato de cada linha:
#   nome:senha:UID:GID:comentário:home:shell
#
# cat lê o arquivo (Aula 06)
# grep -n filtra as linhas que contêm um texto, com número de linha

echo "--- /etc/passwd: todos os usuários do sistema ---"
echo "Comando: cat /etc/passwd"
echo ""
cat /etc/passwd
echo ""

echo "--- grep: filtrando só usuários com shell bash ---"
echo "Comando: cat /etc/passwd | grep -n bash"
echo ""
cat /etc/passwd | grep -n bash
echo ""

# ─── ARQUIVOS DE SISTEMA ─────────────────────────────────────────────────────

echo "--- Arquivos de usuários e grupos ---"
echo ""
echo "  /etc/passwd  → usuários: nome, UID, GID, home, shell"
echo "  /etc/group   → grupos e seus membros"
echo "  /etc/shadow  → senhas (hash) — só root acessa"
echo ""

# ─── COMANDOS QUE PRECISAM DE SUDO ───────────────────────────────────────────
# Os comandos abaixo modificam usuários — precisam de sudo.
# Veja o fluxo completo do curso:

echo "--- Fluxo completo do curso (requer sudo) ---"
echo ""
echo "  1. Criar usuário com home directory:"
echo "       sudo useradd -m maria"
echo ""
echo "  2. Definir senha:"
echo "       sudo passwd maria"
echo ""
echo "  3. Confirmar identidade:"
echo "       su maria"
echo "       id"
echo "       # uid=1002(maria) gid=1002(maria) groups=1002(maria)"
echo ""
echo "  4. Adicionar ao grupo sudo (dar permissão de administrador):"
echo "       sudo usermod -aG sudo maria"
echo ""
echo "  5. Atualizar o shell para bash:"
echo "       sudo usermod -s /bin/bash maria"
echo ""
echo "  6. Verificar resultado:"
echo "       su maria && id"
echo "       # groups=1002(maria),27(sudo)"
echo ""

echo "============================================"
echo "  Próxima aula: Logs e Segurança (Aula 10)"
echo "  Execute: ./log-watcher.sh"
echo "============================================"
