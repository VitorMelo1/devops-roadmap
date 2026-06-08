#!/bin/bash
# =============================================================================
# backup.sh
# Backs up a source directory to a timestamped destination folder.
#
# Usage:
#   ./backup.sh [source_dir] [backup_dir]
#
# Defaults:
#   source_dir  = $HOME
#   backup_dir  = /tmp/backups
#
# Crontab example (every day at 02:00):
#   0 2 * * * /home/user/scripts/backup.sh /home/user /tmp/backups
#
# Part of: devops-roadmap/01-linux-fundamentals
# =============================================================================

SOURCE=${1:-$HOME}
BACKUP_ROOT=${2:-/tmp/backups}
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_PATH="$BACKUP_ROOT/backup_$TIMESTAMP"

# --- Validation ---
if [ ! -d "$SOURCE" ]; then
  echo "[ERROR] Source directory not found: $SOURCE"
  exit 1
fi

# --- Create backup destination ---
mkdir -p "$BACKUP_PATH"
if [ $? -ne 0 ]; then
  echo "[ERROR] Could not create backup directory: $BACKUP_PATH"
  exit 1
fi

# --- Run backup ---
echo "[INFO] Starting backup..."
echo "[INFO] Source    : $SOURCE"
echo "[INFO] Destination: $BACKUP_PATH"
echo "[INFO] Timestamp : $TIMESTAMP"
echo ""

cp -r "$SOURCE/." "$BACKUP_PATH"

if [ $? -eq 0 ]; then
  echo "[SUCCESS] Backup completed: $BACKUP_PATH"
else
  echo "[ERROR] Backup failed."
  exit 1
fi

# --- Cleanup: remove backups older than 7 days ---
echo ""
echo "[INFO] Cleaning up backups older than 7 days in $BACKUP_ROOT..."
find "$BACKUP_ROOT" -maxdepth 1 -type d -name "backup_*" -mtime +7 -exec rm -rf {} \;
echo "[INFO] Cleanup done."
echo "[INFO] Finished at: $(date)"
