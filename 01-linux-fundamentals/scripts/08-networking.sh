#!/bin/bash
# =============================================================================
# 08-networking.sh — Lesson 08: Network Diagnostics on Linux
# =============================================================================
# What you'll learn:
#   - ping       → test if a host is reachable
#   - nslookup   → resolve a domain name to IP (DNS query)
#   - ifconfig   → list network interfaces and their IPs
#   - netstat    → show open ports on the system
#
# How to run:
#   chmod +x 08-networking.sh
#   ./08-networking.sh
#
# Prerequisite: sudo apt-get install net-tools   (for ifconfig and netstat)
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 08 — Network Diagnostics"
echo "  $(date)"
echo "============================================"
echo ""

# ─── ping: TEST CONNECTIVITY ─────────────────────────────────────────────────
# ping sends ICMP packets to the target and waits for a reply.
# If it replies: the host is reachable.
# If it doesn't: could be a network, DNS, or firewall issue.
#
# In the course: ping google.com (runs forever — press Ctrl+C to stop)
# In this script we use -c 3 to limit to 3 packets and not freeze the terminal.

echo "--- ping: testing connection to google.com ---"
echo "Command: ping google.com   (in the terminal, press Ctrl+C to stop)"
echo ""
ping -c 3 google.com
echo ""

# ─── nslookup: RESOLVE DOMAIN TO IP (DNS) ────────────────────────────────────
# nslookup asks the DNS server: what is the IP for this domain?
# Useful to confirm DNS is working correctly.
#
# Flow: you type 'alura.com.br' → nslookup returns the IP → ping uses the IP

echo "--- nslookup: finding the IP of google.com ---"
echo "Command: nslookup google.com"
echo ""
nslookup google.com
echo ""

# ─── ifconfig: NETWORK INTERFACES ────────────────────────────────────────────
# ifconfig lists all network interfaces on the computer:
#   eth0 / ens33  → wired network card
#   wlan0          → Wi-Fi
#   lo             → loopback (127.0.0.1 — internal communication)
#
# The IP shown under 'inet' is the local IP of the machine.

echo "--- ifconfig: active network interfaces ---"
echo "Command: ifconfig"
echo ""
ifconfig
echo ""

# ─── netstat -ntpl: OPEN PORTS (RUNNING SERVICES) ────────────────────────────
# netstat shows active network connections on the system.
# -n = show numbers (don't resolve names)
# -t = TCP only
# -p = show which process is using the port
# -l = only show listening (open) ports
#
# Useful output examples:
#   0.0.0.0:22   LISTEN  sshd    → SSH server is active
#   0.0.0.0:80   LISTEN  nginx   → web server is active

echo "--- netstat: open ports on the system ---"
echo "Command: netstat -ntpl"
echo ""
netstat -ntpl
echo ""

echo "============================================"
echo "  Next lesson: Users and Groups (Lesson 09)"
echo "  Run: ./09-users.sh"
echo "============================================"
