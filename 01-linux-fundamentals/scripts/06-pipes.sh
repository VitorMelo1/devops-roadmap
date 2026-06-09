#!/bin/bash
# =============================================================================
# 06-pipes.sh — Lesson 06: Pipes and Redirectors
# =============================================================================
# What you'll learn:
#   - pipe  |   connects the output of one command to the input of the next
#   - >         redirects output to a file (overwrites)
#   - >>        redirects output to a file (appends)
#   - cat       reads the content of a file
#   - grep -n   filters lines containing text, showing line number
#   - sort      sorts lines alphabetically
#   - wc -l     counts lines
#
# How to run:
#   chmod +x 06-pipes.sh
#   ./06-pipes.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 06 — Pipes and Redirectors"
echo "============================================"
echo ""

# ─── PIPE | ──────────────────────────────────────────────────────────────────
# pipe | connects commands in sequence:
# the output of the first becomes the input of the second, and so on.
# Think of it as a production line — each command transforms the data.

echo "--- Pipeline from the course ---"
echo "Command: cat /etc/passwd | grep -n root | sort"
echo ""

# Step by step of what happens:
#   1. cat /etc/passwd   → reads the entire file
#   2. grep -n root      → filters only lines containing 'root'
#                          -n shows the line number
#   3. sort              → sorts the result alphabetically
cat /etc/passwd | grep -n root | sort

echo ""
echo "Other useful commands in pipelines:"
echo "  wc -l  → counts how many lines the output has"
echo "  sort   → sorts alphabetically"
echo ""
echo "Example: cat /etc/passwd | wc -l"
cat /etc/passwd | wc -l
echo "(number of users on the system)"
echo ""

# ─── REDIRECTOR > (overwrites) ───────────────────────────────────────────────
# > redirects output to a file.
# WARNING: it erases the previous content every time it runs.

FILE="/tmp/my-log.txt"

echo "--- Redirector > (overwrites) ---"
echo "first line"   > $FILE
echo "second line"  > $FILE   # this line erased the previous one!
echo "File content after two > in a row:"
cat $FILE                      # shows only: 'second line'
echo ""

# ─── REDIRECTOR >> (appends) ─────────────────────────────────────────────────
# >> appends to the end of the file without erasing existing content.
# Ideal for logs — each run adds a new line.

echo "--- Redirector >> (appends) ---"
echo "$(date) — run 1" >> $FILE
echo "$(date) — run 2" >> $FILE
echo "File content after two >> in a row:"
cat $FILE                      # shows: second line + both dates
echo ""

echo "Run this script twice and watch the file grow:"
echo "  ./06-pipes.sh"
echo "  cat $FILE"
echo ""

echo "============================================"
echo "  Next lesson: Task Scheduling (Lesson 07)"
echo "  Run: ./07-crontab.sh"
echo "============================================"
