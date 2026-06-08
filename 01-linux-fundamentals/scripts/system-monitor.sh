#!/bin/bash
# =============================================================================
# system-monitor.sh
# Prints a snapshot of key system metrics.
#
# Usage:
#   ./system-monitor.sh
#   ./system-monitor.sh >> /var/log/monitor.log   (append to log file)
#
# Crontab example (every hour, Mon–Fri):
#   0 9-18 * * 1-5 /home/user/scripts/system-monitor.sh >> /var/log/monitor.log
#
# Part of: devops-roadmap/01-linux-fundamentals
# =============================================================================

SEPARATOR="========================================"

echo "$SEPARATOR"
echo "  System Monitor Report"
echo "  $(date)"
echo "$SEPARATOR"

# --- Disk Usage ---
echo ""
echo "📦 Disk Usage"
echo "---"
df -h --output=source,size,used,avail,pcent,target | grep -v "tmpfs\|udev"

# --- Memory ---
echo ""
echo "🧠 Memory Usage"
echo "---"
free -h

# --- CPU Load & Uptime ---
echo ""
echo "⏱  Uptime & Load Average"
echo "---"
uptime

# --- Active Users ---
echo ""
echo "👤 Active Users"
echo "---"
who

# --- Top 5 Processes by CPU ---
echo ""
echo "🔥 Top 5 Processes (by CPU)"
echo "---"
ps aux --sort=-%cpu | awk 'NR==1 || NR<=6 {print $1, $2, $3, $4, $11}' | column -t

# --- Open Ports ---
echo ""
echo "🌐 Listening Ports (TCP)"
echo "---"
if command -v netstat &> /dev/null; then
  netstat -ntpl 2>/dev/null | grep LISTEN
else
  ss -ntpl
fi

echo ""
echo "$SEPARATOR"
echo "  Report complete — $(date)"
echo "$SEPARATOR"
