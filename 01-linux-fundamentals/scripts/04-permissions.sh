#!/bin/bash
# =============================================================================
# 04-permissions.sh — Lesson 04: File Permissions
# =============================================================================
# What you'll learn:
#   - How to read file permissions (rwx)
#   - chmod → change permissions (symbolic and numeric)
#   - chown → change owner and group
#   - chgrp → change group only
#   - id    → see your identity in the system
#
# How to run:
#   chmod +x 04-permissions.sh
#   ./04-permissions.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 04 — File Permissions"
echo "============================================"
echo ""

# ─── HOW TO READ PERMISSIONS ─────────────────────────────────────────────────
# Every file has 3 permission groups:
#   owner (user) | group | others
#
# Each group has 3 flags:
#   r = read    = 4
#   w = write   = 2
#   x = execute = 1
#   - = no permission = 0
#
# Example: -rwxrw-r--
#   - = it's a file (d would be a directory)
#   rwx = owner can read, write, and execute  (7 = 4+2+1)
#   rw- = group can read and write            (6 = 4+2)
#   r-- = others can only read                (4)

echo "--- How to read permissions ---"
echo ""
echo "  Format: [type][owner][group][others]"
echo "  Example: -rwxrw-r--"
echo ""
echo "  r = read    (4)"
echo "  w = write   (2)"
echo "  x = execute (1)"
echo "  - = no permission (0)"
echo ""
echo "  Common combinations:"
echo "    7 = rwx (4+2+1) → read + write + execute"
echo "    6 = rw- (4+2)   → read + write"
echo "    5 = r-x (4+1)   → read + execute"
echo "    4 = r-- (4)     → read only"
echo ""

# ─── id: WHO AM I? ───────────────────────────────────────────────────────────
# id shows your UID, GID, and groups.
# UID = User ID | GID = Group ID

echo "--- id: my identity in the system ---"
echo "Command: id"
echo ""
id
echo ""

# ─── ls -las: SEE FILE PERMISSIONS ───────────────────────────────────────────
# The first column of ls -las shows the permissions of each file.

echo "--- ls -las: permissions of files in this folder ---"
echo "Command: ls -las"
echo ""
ls -las
echo ""

# ─── chmod: CHANGE PERMISSIONS ───────────────────────────────────────────────
# Two modes: symbolic (letters) or numeric (numbers).

# Create a test file to demonstrate chmod
TEST_FILE="/tmp/test-permission.sh"
echo "#!/bin/bash" > $TEST_FILE
echo "echo 'Test script'" >> $TEST_FILE

echo "--- chmod: changing permissions ---"
echo ""
echo "Test file created: $TEST_FILE"
echo ""

echo "Permission BEFORE chmod:"
ls -l $TEST_FILE
echo ""

# Symbolic mode: u = user, g = group, o = others, + = add, - = remove
echo "Command: chmod u+x $TEST_FILE   (add execute for owner)"
chmod u+x $TEST_FILE
ls -l $TEST_FILE
echo ""

# Numeric mode: most common in practice
echo "Command: chmod 764 $TEST_FILE   (owner: rwx | group: rw- | others: r--)"
chmod 764 $TEST_FILE
ls -l $TEST_FILE
echo ""

echo "Command: chmod 400 $TEST_FILE   (read-only for owner — used for SSH keys)"
chmod 400 $TEST_FILE
ls -l $TEST_FILE
echo ""

echo "--- Most common combinations in practice ---"
echo ""
echo "  chmod 755 script.sh   → executable by all, editable only by owner"
echo "  chmod 700 private.sh  → only owner can access"
echo "  chmod 400 key.pem     → SSH key — read only, owner only"
echo "  chmod 764 hello.sh    → from the course: owner (rwx), group (rw-), others (r--)"
echo ""

echo "============================================"
echo "  Next lesson: Package Management (Lesson 05)"
echo "  Run: ./05-packages.sh"
echo "============================================"
