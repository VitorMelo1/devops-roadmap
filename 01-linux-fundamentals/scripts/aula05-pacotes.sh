#!/bin/bash
# =============================================================================
# aula05-pacotes.sh — Aula 05: Gerenciamento de Pacotes
# =============================================================================
# O que você vai aprender:
#   - apt-cache search  → buscar pacote por nome
#   - dpkg -L           → listar arquivos instalados por um pacote
#   - dpkg -S           → descobrir a qual pacote um arquivo pertence
#   - Como instalar e remover (requer sudo)
#
# Para executar:
#   chmod +x aula05-pacotes.sh
#   ./aula05-pacotes.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Aula 05 — Gerenciamento de Pacotes"
echo "============================================"
echo ""

# ─── O QUE É UM PACOTE? ──────────────────────────────────────────────────────
# Um pacote é um conjunto de arquivos que, ao instalar, distribui cada parte
# para o diretório correto segundo o FHS (Aula 03):
#   binários    → /usr/bin
#   configs     → /etc
#   docs        → /usr/share/doc
#   bibliotecas → /usr/lib

echo "--- O que é um pacote? ---"
echo ""
echo "  Pacote = programa empacotado para instalar no Linux"
echo ""
echo "  Ao instalar, os arquivos vão para:"
echo "    /usr/bin       → binários (o executável)"
echo "    /etc           → configurações"
echo "    /usr/share/doc → documentação"
echo "    /usr/lib       → bibliotecas"
echo ""

# ─── GERENCIADORES POR DISTRO ────────────────────────────────────────────────

echo "--- Gerenciadores de pacote por distro ---"
echo ""
echo "  APT (apt-get)  → Debian / Ubuntu  → formato .deb"
echo "  DNF / YUM      → Fedora / RHEL    → formato .rpm"
echo "  Zypper         → openSUSE         → formato .rpm"
echo ""

# ─── apt-cache search: BUSCAR PACOTE ─────────────────────────────────────────
# apt-cache search procura pacotes pelo nome sem instalar nada.
# Pode combinar com grep para filtrar melhor.

echo "--- apt-cache search: buscando pacotes de vim ---"
echo "Comando: apt-cache search vim | grep vim"
echo ""
apt-cache search vim | grep vim
echo ""

# ─── dpkg -L: LISTAR ARQUIVOS DE UM PACOTE ───────────────────────────────────
# dpkg -L mostra todos os arquivos que um pacote instalou no sistema.
# Útil para saber onde ficou o binário, a config, a documentação.

echo "--- dpkg -L: arquivos instalados pelo pacote 'bash' ---"
echo "Comando: dpkg -L bash"
echo ""
dpkg -L bash
echo ""

# ─── dpkg -S: A QUAL PACOTE ESTE ARQUIVO PERTENCE? ───────────────────────────
# dpkg -S descobre qual pacote instalou determinado arquivo.

echo "--- dpkg -S: qual pacote instalou o /bin/ls? ---"
echo "Comando: dpkg -S /bin/ls"
echo ""
dpkg -S /bin/ls
echo ""

# ─── COMANDOS QUE PRECISAM DE SUDO ───────────────────────────────────────────
# Os comandos abaixo modificam o sistema — precisam de sudo.
# Não vamos executá-los aqui, mas é importante conhecer.

echo "--- Comandos que precisam de sudo (não executados aqui) ---"
echo ""
echo "  sudo apt update                  → atualiza lista de repositórios"
echo "  sudo apt-get install nginx       → instala o nginx"
echo "  sudo apt-get remove vim          → remove o vim"
echo ""
echo "  Fluxo completo do curso:"
echo "    sudo apt-get remove vim"
echo "    apt-cache search vim | grep vim"
echo "    sudo apt-get install vim"
echo "    ls /bin/vim"
echo "    dpkg -S /usr/share/doc/vim"
echo "    dpkg -L vim"
echo ""

echo "============================================"
echo "  Próxima aula: Shell Script (Aula 06)"
echo "  Execute: ./hello-linux.sh e ./pipes-demo.sh"
echo "============================================"
