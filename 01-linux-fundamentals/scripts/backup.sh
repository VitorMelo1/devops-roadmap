#!/bin/bash
# backup.sh — copia uma pasta com data e hora no nome
# Para executar: chmod +x backup.sh && ./backup.sh
#
# Agendar com crontab (todo dia às 02:00):
#   crontab -e
#   0 2 * * * /caminho/para/backup.sh

# Variáveis — guardam valores para reutilizar no script
ORIGEM="/home/vitor"
DESTINO_BASE="/tmp/backups"

# $(date +formato) formata a data como texto
# %Y = ano, %m = mês, %d = dia, %H = hora, %M = minuto, %S = segundo
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

# Concatena variáveis para montar o caminho completo
DESTINO="$DESTINO_BASE/backup_$TIMESTAMP"

echo "[INFO] Iniciando backup..."
echo "[INFO] Origem  : $ORIGEM"
echo "[INFO] Destino : $DESTINO"
echo "[INFO] Horário : $TIMESTAMP"
echo ""

# mkdir cria uma pasta (-p cria as pastas intermediárias se não existirem)
mkdir -p "$DESTINO"

# cp copia arquivos e pastas
# -r = recursivo (copia subpastas também)
# "$ORIGEM/." copia o conteúdo da pasta (não a pasta em si)
cp -r "$ORIGEM/." "$DESTINO"

echo "[OK] Backup salvo em: $DESTINO"

# >> redireciona a saída e acumula no arquivo (não apaga o que já existe)
echo "$(date) — backup em $DESTINO" >> /tmp/backup.log

echo "[OK] Concluído em: $(date)"
