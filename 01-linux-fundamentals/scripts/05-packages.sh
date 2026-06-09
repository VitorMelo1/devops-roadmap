#!/bin/bash
# =============================================================================
# 05-packages.sh — Lesson 05: Package Management
# =============================================================================
# What you'll learn:
#   - apt-cache search  → search for a package by name
#   - dpkg -L           → list files installed by a package
#   - dpkg -S           → find which package owns a file
#   - How to install and remove packages (requires sudo)
#
# How to run:
#   chmod +x 05-packages.sh
#   ./05-packages.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 05 — Package Management"
echo "============================================"
echo ""

# ─── WHAT IS A PACKAGE? ──────────────────────────────────────────────────────
# A package is a bundle of files that, when installed, places each part
# in the correct directory according to the FHS (Lesson 03):
#   binaries    → /usr/bin
#   configs     → /etc
#   docs        → /usr/share/doc
#   libraries   → /usr/lib

echo "--- What is a package? ---"
echo ""
echo "  Package = a program bundled for installation on Linux"
echo ""
echo "  When installed, files go to:"
echo "    /usr/bin       → binaries (the executable)"
echo "    /etc           → configuration files"
echo "    /usr/share/doc → documentation"
echo "    /usr/lib       → libraries"
echo ""

# ─── PACKAGE MANAGERS BY DISTRO ──────────────────────────────────────────────

echo "--- Package managers by distro ---"
echo ""
echo "  APT (apt-get)  → Debian / Ubuntu  → .deb format"
echo "  DNF / YUM      → Fedora / RHEL    → .rpm format"
echo "  Zypper         → openSUSE         → .rpm format"
echo ""

# ─── apt-cache search: SEARCH FOR A PACKAGE ──────────────────────────────────
# apt-cache search looks for packages by name without installing anything.
# Can be combined with grep to filter results further.

echo "--- apt-cache search: searching for vim packages ---"
echo "Command: apt-cache search vim | grep vim"
echo ""
apt-cache search vim | grep vim
echo ""

# ─── dpkg -L: LIST FILES OF A PACKAGE ────────────────────────────────────────
# dpkg -L shows all files that a package installed on the system.
# Useful to find where the binary, config, and documentation ended up.

echo "--- dpkg -L: files installed by the 'bash' package ---"
echo "Command: dpkg -L bash"
echo ""
dpkg -L bash
echo ""

# ─── dpkg -S: WHICH PACKAGE OWNS THIS FILE? ──────────────────────────────────
# dpkg -S finds which package installed a given file.

echo "--- dpkg -S: which package installed /bin/ls? ---"
echo "Command: dpkg -S /bin/ls"
echo ""
dpkg -S /bin/ls
echo ""

# ─── COMMANDS THAT REQUIRE SUDO ──────────────────────────────────────────────
# The commands below modify the system — they require sudo.
# Not executed here, but important to know.

echo "--- Commands that require sudo (not executed here) ---"
echo ""
echo "  sudo apt update                  → update package list from repositories"
echo "  sudo apt-get install nginx       → install nginx"
echo "  sudo apt-get remove vim          → remove vim"
echo ""
echo "  Full flow from the course:"
echo "    sudo apt-get remove vim"
echo "    apt-cache search vim | grep vim"
echo "    sudo apt-get install vim"
echo "    ls /bin/vim"
echo "    dpkg -S /usr/share/doc/vim"
echo "    dpkg -L vim"
echo ""

echo "============================================"
echo "  Next lesson: Shell Scripting (Lesson 06)"
echo "  Run: ./06-variables.sh and ./06-pipes.sh"
echo "============================================"
