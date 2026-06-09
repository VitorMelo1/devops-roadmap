#!/bin/bash
# =============================================================================
# 01-distros.sh — Lesson 01: Linux Distributions and Philosophy
# =============================================================================
# What you'll learn:
#   - What a Linux distribution is
#   - The main distros and their focus
#   - Where Linux is used every day
#
# Theory lesson — this script uses echo to display concepts in the terminal.
# How to run:
#   chmod +x 01-distros.sh
#   ./01-distros.sh
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 01 — Linux Distributions"
echo "============================================"
echo ""

# ─── WHAT IS A DISTRIBUTION? ─────────────────────────────────────────────────
# A distribution (distro) is a version of Linux built by a community
# for a specific purpose. All distros share the same kernel but differ
# in philosophy, tools, and target audience.

echo "--- What is a Distribution? ---"
echo ""
echo "Linux = Kernel (the core of the system)"
echo "Distro = Kernel + tools + philosophy + community"
echo ""
echo "All distros run the same kernel — but each has its own purpose."
echo ""

# ─── MAIN DISTROS ────────────────────────────────────────────────────────────

echo "--- Main Distributions ---"
echo ""
echo "  Debian      → 100% free software (GPL), base for many others"
echo "  Ubuntu      → Debian-based, focused on accessibility"
echo "  Slackware   → simplicity, own philosophy"
echo "  Red Hat     → enterprise environments, paid support"
echo "  Conectiva   → Brazilian distro, 1990s-2000s (discontinued)"
echo ""

echo "--- The 4 pillars that differentiate distros ---"
echo ""
echo "  1. Purpose    → specific need (server, desktop, security)"
echo "  2. Philosophy → free software vs. proprietary"
echo "  3. Tools      → which open/closed source packages are allowed"
echo "  4. Freedom    → educational, commercial, or personal use"
echo ""

# ─── WHERE LINUX IS USED ─────────────────────────────────────────────────────

echo "--- Where Linux is used (you use it every day without knowing) ---"
echo ""
echo "  Cloud    → AWS, GCP, and Azure all run Linux"
echo "  Mobile   → Android is modified Linux"
echo "  TV       → smart TVs and routers run embedded Linux"
echo "  Servers  → most web servers and databases run Linux"
echo "  DevOps   → Docker, Kubernetes, and CI/CD run on Linux"
echo ""

echo "============================================"
echo "  Next lesson: Boot Process (Lesson 02)"
echo "  Run: ./02-boot.sh"
echo "============================================"
