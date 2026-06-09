#!/bin/bash
# =============================================================================
# 02-boot.sh — Lesson 02: Linux Boot Process
# =============================================================================
# What you'll learn:
#   - What happens from power button to login screen
#   - Each boot stage: BIOS → GRUB → Kernel → Init
#   - Available interfaces (GUI and terminal)
#
# Theory lesson — this script uses echo to display concepts in the terminal.
# How to run:
#   chmod +x 02-boot.sh
#   ./02-boot.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 02 — Linux Boot Process"
echo "============================================"
echo ""

# ─── BOOT PROCESS ────────────────────────────────────────────────────────────
# Everything that happens between pressing the power button
# and the login screen appearing.

echo "--- What happens when you power on a computer ---"
echo ""
echo "  Power button"
echo "      ↓"
echo "  BIOS/UEFI  → first software to run; executes POST (checks hardware)"
echo "      ↓"
echo "  GRUB       → boot loader; shows kernel menu and points to the OS"
echo "      ↓"
echo "  InitRunfs  → temporary mini-Linux; loads hardware drivers"
echo "      ↓"
echo "  Kernel     → core of Linux; mounts the filesystem"
echo "      ↓"
echo "  Init       → PID 1; starts all system services"
echo "      ↓"
echo "  Login screen"
echo ""

echo "--- Each component in detail ---"
echo ""
echo "  BIOS/UEFI    → checks RAM, disk, keyboard before anything else (POST)"
echo "  GRUB         → lets you choose which kernel or OS to boot"
echo "  InitRunfs    → loads drivers so the kernel can understand hardware"
echo "  Kernel       → manages CPU, memory, and devices"
echo "  Init (PID 1) → parent of all processes; starts services like SSH and Nginx"
echo ""

# ─── LINUX INTERFACES ────────────────────────────────────────────────────────

echo "--- Available interfaces ---"
echo ""
echo "  Graphical Mode (GUI):"
echo "    KDE         → feature-rich, high CPU/RAM usage"
echo "    Gnome       → popular, different approach from KDE"
echo "    XFCE        → lightweight, ideal for older hardware"
echo "    Fluxbox     → minimalist, very low resource usage"
echo ""
echo "  Terminal Mode:"
echo "    Pure text interface"
echo "    More practical for servers, automation, and administration"
echo "    Default mode on cloud servers (no GUI)"
echo ""

echo "--- Why do servers use terminal mode? ---"
echo ""
echo "  GUI consumes RAM and CPU that could be used by the application."
echo "  Terminal is enough to manage any system."
echo "  This entire course is done in terminal mode."
echo ""

echo "============================================"
echo "  Next lesson: Directory Structure (Lesson 03)"
echo "  Run: ./03-fhs.sh"
echo "============================================"
