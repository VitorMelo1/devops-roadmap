#!/bin/bash
# =============================================================================
# 11-nginx.sh — Lesson 11: Final Lab — Nginx Web Server
# =============================================================================
# What you'll learn:
#   - systemctl  → manage services (start, stop, check status)
#   - netstat -ntpl → confirm that port 80 is open
#   - How to install and test Nginx (requires sudo)
#
# How to run:
#   chmod +x 11-nginx.sh
#   ./11-nginx.sh
#
# Prerequisite: sudo apt-get install nginx
# =============================================================================

echo ""
echo "============================================"
echo "  Lesson 11 — Final Lab: Nginx Web Server"
echo "============================================"
echo ""

# ─── WHAT IS NGINX? ──────────────────────────────────────────────────────────
# Nginx is a web server — it receives HTTP requests and responds with HTML.
# It is managed by systemd (the Linux Init system — Lesson 02).

echo "--- What is Nginx? ---"
echo ""
echo "  Nginx = web server"
echo "  Listens on port 80 (HTTP) or 443 (HTTPS)"
echo "  Managed by systemd (systemctl)"
echo ""
echo "  Important files:"
echo "    /etc/nginx/nginx.conf        → main configuration"
echo "    /var/www/html/index.html     → default page"
echo "    /var/log/nginx/access.log    → access log"
echo "    /var/log/nginx/error.log     → error log"
echo ""

# ─── systemctl: MANAGE SERVICES ──────────────────────────────────────────────
# systemctl controls services managed by systemd (Init — Lesson 02).
# Works for nginx, ssh, postgresql, gunicorn, and any system service.

echo "--- systemctl: status of nginx ---"
echo "Command: systemctl status nginx"
echo ""
systemctl status nginx
echo ""

echo "--- systemctl commands from the course ---"
echo ""
echo "  systemctl status nginx    → is it running? (active = yes)"
echo "  systemctl start nginx     → start the service"
echo "  systemctl stop nginx      → stop the service"
echo "  systemctl restart nginx   → restart (after changing config)"
echo "  systemctl enable nginx    → start automatically on boot"
echo ""

# ─── netstat -ntpl: CONFIRM PORT IS OPEN ─────────────────────────────────────
# After installing Nginx, netstat confirms it's listening on port 80.
# 0.0.0.0:80 LISTEN = server active and accessible (Lesson 08)

echo "--- netstat -ntpl: open ports (Nginx should appear on port 80) ---"
echo "Command: netstat -ntpl"
echo ""
netstat -ntpl
echo ""

# ─── FULL LAB WALKTHROUGH ────────────────────────────────────────────────────
# This is the course's final lab — it integrates everything learned.

echo "--- Full lab walkthrough ---"
echo ""
echo "  1. Install Nginx:"
echo "       sudo apt update"
echo "       sudo apt-get install nginx"
echo ""
echo "  2. Check if it's running:"
echo "       systemctl status nginx"
echo ""
echo "  3. Confirm port 80 is open:"
echo "       netstat -ntpl"
echo ""
echo "  4. Test in the terminal:"
echo "       telnet localhost 80"
echo "       GET /"
echo "       # Response: HTTP/1.1 200 OK ... Server: nginx/1.24.0"
echo ""
echo "  5. Edit the default page:"
echo "       sudo vim /var/www/html/index.nginx-debian.html"
echo ""
echo "  6. Monitor logs in real time (Lesson 10):"
echo "       tail -f /var/log/nginx/access.log"
echo ""

echo "============================================"
echo "  Course complete! You learned:"
echo "  Distros → Boot → FHS → Permissions → Packages"
echo "  → Shell Script → Crontab → Networking → Users"
echo "  → Logs → Nginx"
echo "============================================"
