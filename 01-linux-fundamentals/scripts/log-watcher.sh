#!/bin/bash
# =============================================================================
# log-watcher.sh
# Scans system logs for recent events and security warnings.
#
# Usage:
#   ./log-watcher.sh           (default: last 10 minutes)
#   ./log-watcher.sh 30        (last 30 minutes)
#   ./log-watcher.sh 60        (last 60 minutes)
#
# Part of: devops-roadmap/01-linux-fundamentals
# =============================================================================

MINUTES=${1:-10}
SEPARATOR="========================================"

echo "$SEPARATOR"
echo "  Log Watcher"
echo "  Scanning last $MINUTES minutes — $(date)"
echo "$SEPARATOR"

# --- Recent System Events ---
echo ""
echo "📋 Recent System Events (last $MINUTES min)"
echo "---"
journalctl --since "$MINUTES minutes ago" --no-pager -q | tail -20

# --- Failed Login Attempts ---
echo ""
echo "🚨 Failed Login Attempts"
echo "---"
FAILED=$(journalctl --since "$MINUTES minutes ago" --no-pager -q | grep -i "failed\|invalid\|authentication failure" | tail -10)
if [ -z "$FAILED" ]; then
  echo "No failed login attempts found."
else
  echo "$FAILED"
fi

# --- Auth Log (if available) ---
echo ""
echo "🔐 Auth Log (last 15 lines)"
echo "---"
if [ -f /var/log/auth.log ]; then
  tail -15 /var/log/auth.log
else
  echo "auth.log not found — using journalctl:"
  journalctl -u ssh --since "$MINUTES minutes ago" --no-pager -q | tail -15
fi

# --- Sudo Usage ---
echo ""
echo "🛡  Sudo Commands Used"
echo "---"
SUDO_USAGE=$(journalctl --since "$MINUTES minutes ago" --no-pager -q | grep "sudo\|COMMAND" | tail -10)
if [ -z "$SUDO_USAGE" ]; then
  echo "No sudo usage found."
else
  echo "$SUDO_USAGE"
fi

echo ""
echo "$SEPARATOR"
echo "  Scan complete. For live monitoring, run:"
echo "    tail -f /var/log/auth.log"
echo "    journalctl -f"
echo "$SEPARATOR"
