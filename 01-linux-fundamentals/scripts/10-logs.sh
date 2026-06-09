#!/bin/bash
# =============================================================================
# 10-logs.sh — Lesson 10: Security and Logs
# =============================================================================
# What you'll learn:
#   - Where logs are stored in Linux (/var/log)
#   - tail       → read the last lines of a file
#   - tail -f    → monitor a file in real time (streaming)
#   - journalctl → read centralized systemd logs
#   - grep       → search for a text pattern inside a file
#
# How to run:
#   chmod +x 10-logs.sh
#   ./10-logs.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 10 — Security and Logs"
echo "  $(date)"
echo "============================================"
echo ""

# ─── WHERE ARE THE LOGS? ─────────────────────────────────────────────────────
# In Linux, all logs are stored under /var/log/ (Lesson 03 — FHS).
# Each service writes to its own file.
#
#   /var/log/syslog    → general system log
#   /var/log/auth.log  → logins, sudo, authentications
#   /var/log/kern.log  → kernel messages
#   /var/log/nginx/    → Nginx access and error logs (Lesson 11)

echo "--- Log files available in /var/log ---"
echo "Command: ls /var/log"
echo ""
ls /var/log
echo ""

# ─── tail: LAST LINES OF A FILE ──────────────────────────────────────────────
# tail with no flags shows the last 10 lines of the file.
# tail -n 20 shows the last 20 lines.
# Useful to see the most recent events without opening the entire file.

echo "--- tail: last 10 lines of auth.log ---"
echo "Command: tail /var/log/auth.log"
echo ""
tail /var/log/auth.log
echo ""

# ─── journalctl: CENTRALIZED SYSTEMD LOG ─────────────────────────────────────
# journalctl reads events from all services managed by systemd.
# It's the most complete command for investigating what happened on the system.
#
# --since "X minutes ago" = events from the last X minutes
# --since today            = everything that happened today
# journalctl -f            = real-time monitoring (like tail -f)

echo "--- journalctl: events from the last 10 minutes ---"
echo "Command: journalctl --since '10 minutes ago'"
echo ""
journalctl --since "10 minutes ago"
echo ""

# ─── grep: SEARCH PATTERN IN FILE ────────────────────────────────────────────
# grep "text" file → filters and shows only lines containing the text.
# Combined with pipe |, chains with tail to see the latest occurrences.
#
# Security use: detect failed login attempts

echo "--- grep: failed login attempts ---"
echo "Command: grep 'Failed password' /var/log/auth.log | tail -n 10"
echo ""
grep "Failed password" /var/log/auth.log | tail -n 10
echo ""

# ─── INCIDENT INVESTIGATION FLOW (FROM THE COURSE) ───────────────────────────
echo "--- Incident investigation flow (Lesson 10) ---"
echo "  1. journalctl --since 'time of incident'  → overview"
echo "  2. tail -f /var/log/auth.log              → suspicious authentications"
echo "  3. grep 'Failed' /var/log/auth.log        → failed attempts"
echo ""
echo "--- Real-time monitoring ---"
echo "  tail -f /var/log/auth.log    → stream auth.log"
echo "  tail -f /var/log/*           → all logs live"
echo "  journalctl -f                → system events live"
echo "  journalctl --since today     → everything from today"
echo ""

echo "============================================"
echo "  Next lesson: Final Lab — Nginx (Lesson 11)"
echo "  Run: ./11-nginx.sh"
echo "============================================"
