#!/bin/bash
# =============================================================================
# 07-crontab.sh — Lesson 07: Task Scheduling with Crontab
# =============================================================================
# What you'll learn:
#   - crontab -l  → list scheduled tasks
#   - crontab -e  → edit scheduled tasks
#   - The syntax of the 5 crontab fields
#   - Real use cases: backup, reports, cleanup
#
# How to run:
#   chmod +x 07-crontab.sh
#   ./07-crontab.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 07 — Crontab and Task Scheduling"
echo "============================================"
echo ""

# ─── WHAT IS CRONTAB? ────────────────────────────────────────────────────────
# crontab is Linux's task scheduler.
# You define: at what time + which command should run automatically.
# Ideal for: daily backups, reports, /tmp cleanup, monitoring.

echo "--- What is crontab? ---"
echo ""
echo "  crontab = automatic task scheduler for Linux"
echo "  Runs in the background — even when you are not logged in."
echo ""

# ─── SYNTAX OF THE 5 FIELDS ──────────────────────────────────────────────────

echo "--- Crontab syntax ---"
echo ""
echo "  ┌─────────── minute     (0-59)"
echo "  │ ┌───────── hour       (0-23)"
echo "  │ │ ┌─────── day of month (1-31)"
echo "  │ │ │ ┌───── month      (1-12)"
echo "  │ │ │ │ ┌─── day of week (0=sun, 1=mon ... 6=sat)"
echo "  │ │ │ │ │"
echo "  * * * * *   /path/to/script.sh"
echo ""
echo "  Symbols:"
echo "    *     → every value"
echo "    */5   → every 5 units"
echo "    1-5   → range (mon to fri)"
echo "    0,30  → specific values (midnight and noon)"
echo ""

# ─── EXAMPLES FROM THE COURSE ────────────────────────────────────────────────

echo "--- Examples from the course ---"
echo ""
echo "  Every day at 02:00 — backup:"
echo "    0 2 * * *   /usr/local/bin/backup.sh"
echo ""
echo "  Monday to Friday at 08:30 — report:"
echo "    30 8 * * 1-5   /usr/bin/echo 'Good morning' >> /tmp/cron.txt"
echo ""
echo "  Every 5 minutes:"
echo "    */5 * * * *   /home/user/script_5min.sh"
echo ""
echo "  Every 5 hours:"
echo "    0 */5 * * *   /home/user/script_5h.sh"
echo ""

# ─── crontab -l: LIST SCHEDULED TASKS ────────────────────────────────────────
# crontab -l lists all tasks for the current user.

echo "--- crontab -l: scheduled tasks for the current user ---"
echo "Command: crontab -l"
echo ""
crontab -l
echo ""

# ─── HOW TO EDIT ─────────────────────────────────────────────────────────────
# crontab -e opens the editor to add or remove tasks.
# Not opening the editor here, but usage is simple:

echo "--- How to add a task ---"
echo ""
echo "  1. Type: crontab -e"
echo "  2. Add a line: minute hour day month weekday /path/to/script.sh"
echo "  3. Save and close (Ctrl+X in nano, :wq in vim)"
echo ""
echo "  Example — run 10-logs.sh every day at 08:00:"
echo "    0 8 * * * /path/to/10-logs.sh >> /tmp/daily-log.txt"
echo ""

echo "============================================"
echo "  Next lesson: Networking (Lesson 08)"
echo "  Run: ./08-networking.sh"
echo "============================================"
