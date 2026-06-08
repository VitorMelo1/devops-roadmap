#!/bin/bash
# =============================================================================
# aula04-permissoes.sh — Aula 04: Permissionamento de Arquivos
# =============================================================================
# O que você vai aprender:
#   - Como ler as permissões de um arquivo (rwx)
#   - chmod → alterar permissões (simbólico e numérico)
#   - chown → alterar dono e grupo
#   - chgrp → alterar só o grupo
#   - id    → ver sua identidade no sistema
#
# Para executar:
#   chmod +x aula04-permissoes.sh
#   ./aula04-permissoes.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Aula 04 — Permissionamento de Arquivos"
echo "============================================"
echo ""

# ─── COMO LER AS PERMISSÕES ──────────────────────────────────────────────────
# Todo arquivo tem 3 grupos de permissão:
#   dono (user) | grupo (group) | outros (others)
#
# Cada grupo tem 3 flags:
#   r = read  (leitura)  = 4
#   w = write (escrita)  = 2
#   x = execute (execução) = 1
#   - = sem permissão    = 0
#
# Exemplo: -rwxrw-r--
#   - = é um arquivo (d seria diretório)
#   rwx = dono pode ler, escrever e executar  (7 = 4+2+1)
#   rw- = grupo pode ler e escrever           (6 = 4+2)
#   r-- = outros só podem ler                 (4)

echo "--- Como ler permissões ---"
echo ""
echo "  Formato: [tipo][dono][grupo][outros]"
echo "  Exemplo: -rwxrw-r--"
echo ""
echo "  r = leitura  (4)"
echo "  w = escrita  (2)"
echo "  x = execução (1)"
echo "  - = sem permissão (0)"
echo ""
echo "  Combinações comuns:"
echo "    7 = rwx (4+2+1) → leitura + escrita + execução"
echo "    6 = rw- (4+2)   → leitura + escrita"
echo "    5 = r-x (4+1)   → leitura + execução"
echo "    4 = r-- (4)     → só leitura"
echo ""

# ─── id: QUEM SOU EU? ────────────────────────────────────────────────────────
# id mostra seu UID, GID e grupos.
# UID = User ID | GID = Group ID

echo "--- id: minha identidade no sistema ---"
echo "Comando: id"
echo ""
id
echo ""

# ─── ls -las: VER PERMISSÕES DOS ARQUIVOS ────────────────────────────────────
# A primeira coluna do ls -las mostra as permissões de cada arquivo.

echo "--- ls -las: permissões dos arquivos desta pasta ---"
echo "Comando: ls -las"
echo ""
ls -las
echo ""

# ─── chmod: ALTERAR PERMISSÕES ───────────────────────────────────────────────
# Dois modos: simbólico (letras) ou numérico (números).

# Criando arquivo de teste para demonstrar chmod
ARQUIVO_TESTE="/tmp/teste-permissao.sh"
echo "#!/bin/bash" > $ARQUIVO_TESTE
echo "echo 'Script de teste'" >> $ARQUIVO_TESTE

echo "--- chmod: alterando permissões ---"
echo ""
echo "Arquivo de teste criado: $ARQUIVO_TESTE"
echo ""

echo "Permissão ANTES de chmod:"
ls -l $ARQUIVO_TESTE
echo ""

# Modo simbólico: u = user, g = group, o = others, + = adiciona, - = remove
echo "Comando: chmod u+x $ARQUIVO_TESTE   (adiciona execução para o dono)"
chmod u+x $ARQUIVO_TESTE
ls -l $ARQUIVO_TESTE
echo ""

# Modo numérico: mais comum no dia a dia
echo "Comando: chmod 764 $ARQUIVO_TESTE   (dono: rwx | grupo: rw- | outros: r--)"
chmod 764 $ARQUIVO_TESTE
ls -l $ARQUIVO_TESTE
echo ""

echo "Comando: chmod 400 $ARQUIVO_TESTE   (só leitura para o dono — usado em chaves SSH)"
chmod 400 $ARQUIVO_TESTE
ls -l $ARQUIVO_TESTE
echo ""

echo "--- Combinações mais usadas no dia a dia ---"
echo ""
echo "  chmod 755 script.sh   → script executável por todos, editável só pelo dono"
echo "  chmod 700 privado.sh  → só o dono acessa"
echo "  chmod 400 chave.pem   → chave SSH — só leitura, só pelo dono"
echo "  chmod 764 ola.sh      → do curso: dono (rwx), grupo (rw-), outros (r--)"
echo ""

echo "============================================"
echo "  Próxima aula: Gerenciamento de Pacotes (Aula 05)"
echo "============================================"
