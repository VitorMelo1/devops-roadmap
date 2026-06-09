#!/bin/bash
# =============================================================================
# 03-fhs.sh — Lesson 03: Filesystem Hierarchy Standard (FHS)
# =============================================================================
# What you'll learn:
#   - pwd  → where you are in the system
#   - ls   → what's inside a folder
#   - cd   → navigate between folders (interactive — use in terminal, not script)
#   - The purpose of each Linux directory (/etc, /var, /home...)
#
# How to run:
#   chmod +x 03-fhs.sh
#   ./03-fhs.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 03 — Filesystem Hierarchy (FHS)"
echo "============================================"
echo ""

# ─── FILESYSTEM HIERARCHY STANDARD ───────────────────────────────────────────
# In Linux, every directory has a specific purpose.
# This is defined by the FHS — a standard followed by all distros.

echo "--- Linux directory map ---"
echo ""
echo "  /             → root: everything starts here"
echo "  /etc          → system and service configuration files"
echo "  /var/log      → system logs (used heavily in Lesson 10)"
echo "  /usr/bin      → installed programs (python3, vim, nginx...)"
echo "  /bin          → essential commands (ls, cp, mv, rm, cd)"
echo "  /home         → personal files of each user"
echo "  /tmp          → temporary files (cleared on reboot)"
echo "  /dev          → devices (/dev/video0 = camera, /dev/sda = disk)"
echo "  /proc         → kernel information in real time"
echo ""

# ─── cd: NAVIGATE BETWEEN FOLDERS ────────────────────────────────────────────
# cd is not demonstrated here because inside a script it only changes
# the script's directory, not the user's terminal. Use cd directly in terminal:

echo "--- cd: navigation (use directly in the terminal) ---"
echo "  cd /etc       → go to configuration files"
echo "  cd /var/log   → go to system logs"
echo "  cd ~          → go to home directory"
echo "  cd ..         → go up one level"
echo ""

# ─── pwd: WHERE AM I? ────────────────────────────────────────────────────────
# pwd = print working directory
# Shows the full path of the folder you are currently in.

echo "--- pwd: where am I right now? ---"
echo "Command: pwd"
echo ""
pwd
echo ""

# ─── ls: WHAT'S IN HERE? ─────────────────────────────────────────────────────
# ls lists the files and folders in the current directory.
# -l = long format (permissions, owner, size, date)
# -a = show hidden files (files starting with .)
# -s = show size in blocks
# Combined: ls -las

echo "--- ls -las: detailed content of current folder ---"
echo "Command: ls -las"
echo ""
ls -las
echo ""

# ─── EXPLORING IMPORTANT DIRECTORIES ─────────────────────────────────────────

echo "--- ls /var/log: where system logs are stored ---"
echo "Command: ls /var/log"
echo ""
ls /var/log
echo ""

echo "============================================"
echo "  Next lesson: File Permissions (Lesson 04)"
echo "  Run: ./04-permissions.sh"
echo "============================================"
