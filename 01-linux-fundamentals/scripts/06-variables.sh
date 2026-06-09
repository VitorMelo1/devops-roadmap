#!/bin/bash
# =============================================================================
# 06-variables.sh — Lesson 06: Variables and Command Substitution
# =============================================================================
# What you'll learn:
#   - What the shebang (#!/bin/bash) does
#   - How to create and use variables
#   - How to capture command output with $(command)
#   - echo, date, pwd, ls
#
# How to run:
#   chmod +x 06-variables.sh    ← grant execution permission (Lesson 04)
#   ./06-variables.sh           ← run with relative path
# =============================================================================

# ─── SHEBANG ─────────────────────────────────────────────────────────────────
# The #!/bin/bash line at the top tells the system which interpreter to use.
# Without it, the system doesn't know this file is a bash script.

# ─── VARIABLES ───────────────────────────────────────────────────────────────
# A variable stores a value to reuse anywhere in the script.
# Rule: no spaces around = and no $ when creating the variable.
NAME="Vitor"
COURSE="Linux Fundamentals"

echo ""
echo "============================================"
echo "  Hello, Linux!"
echo "============================================"
echo ""

echo "--- Variables ---"
echo "NAME  : $NAME"     # $ before the name reads the variable's value
echo "COURSE: $COURSE"
echo ""

# ─── COMMAND SUBSTITUTION $() ────────────────────────────────────────────────
# $(command) executes the command and captures its output as a value.
# Any command can be used: date, pwd, ls, cat...
DATE=$(date)     # runs `date` and stores the result in DATE
FOLDER=$(pwd)    # pwd = print working directory — shows where you are (Lesson 03)

echo "--- Command Substitution ---"
echo "Current date  : $DATE"
echo "Current folder: $FOLDER"
echo ""

# ─── ls: LIST FILES IN THE FOLDER ────────────────────────────────────────────
# ls -las shows: permissions, size, owner, date, and file name (Lesson 03)
echo "--- Contents of the current folder (ls -las) ---"
ls -las
echo ""

echo "============================================"
echo "  Next: Pipes and Redirectors"
echo "  Run: ./06-pipes.sh"
echo "============================================"
