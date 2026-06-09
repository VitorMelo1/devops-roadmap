#!/bin/bash
# =============================================================================
# 09-users.sh — Lesson 09: User and Group Management
# =============================================================================
# What you'll learn:
#   - id            → your identity in the system (UID, GID, groups)
#   - cat /etc/passwd → view all registered users
#   - Commands requiring sudo: useradd, passwd, usermod, su
#
# How to run:
#   chmod +x 09-users.sh
#   ./09-users.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 09 — Users and Groups"
echo "============================================"
echo ""

# ─── LINUX IDENTITY MODEL ────────────────────────────────────────────────────
# Every user in Linux has:
#   UID = User ID     (unique number identifying the user)
#   GID = Group ID    (primary group)
#   extra groups      (sudo, www-data, adm...)

echo "--- Linux identity model ---"
echo ""
echo "  Every user has:"
echo "    UID    → unique number that identifies the user"
echo "    GID    → user's primary group"
echo "    groups → extra groups (e.g. sudo = administrator permission)"
echo ""

# ─── id: WHO AM I? ───────────────────────────────────────────────────────────
# id with no arguments shows your current identity.
# id <username> shows the identity of another user.

echo "--- id: my current identity ---"
echo "Command: id"
echo ""
id
echo ""

# ─── /etc/passwd: USER FILE ──────────────────────────────────────────────────
# /etc/passwd lists all users on the system.
# Format of each line:
#   name:password:UID:GID:comment:home:shell
#
# cat reads the file (Lesson 06)
# grep -n filters lines containing text, with line numbers

echo "--- /etc/passwd: all users on the system ---"
echo "Command: cat /etc/passwd"
echo ""
cat /etc/passwd
echo ""

echo "--- grep: filtering only users with bash shell ---"
echo "Command: cat /etc/passwd | grep -n bash"
echo ""
cat /etc/passwd | grep -n bash
echo ""

# ─── SYSTEM FILES ────────────────────────────────────────────────────────────

echo "--- User and group system files ---"
echo ""
echo "  /etc/passwd  → users: name, UID, GID, home, shell"
echo "  /etc/group   → groups and their members"
echo "  /etc/shadow  → passwords (hashed) — root access only"
echo ""

# ─── COMMANDS THAT REQUIRE SUDO ──────────────────────────────────────────────
# The commands below modify users — they require sudo.
# Full flow from the course:

echo "--- Full flow from the course (requires sudo) ---"
echo ""
echo "  1. Create a user with home directory:"
echo "       sudo useradd -m maria"
echo ""
echo "  2. Set a password:"
echo "       sudo passwd maria"
echo ""
echo "  3. Confirm identity:"
echo "       su maria"
echo "       id"
echo "       # uid=1002(maria) gid=1002(maria) groups=1002(maria)"
echo ""
echo "  4. Add to sudo group (grant administrator permission):"
echo "       sudo usermod -aG sudo maria"
echo ""
echo "  5. Set shell to bash:"
echo "       sudo usermod -s /bin/bash maria"
echo ""
echo "  6. Verify result:"
echo "       su maria"
echo "       id"
echo "       # groups=1002(maria),27(sudo)"
echo ""

echo "============================================"
echo "  Next lesson: Security and Logs (Lesson 10)"
echo "  Run: ./10-logs.sh"
echo "============================================"
