# 🐧 Step 01 — Linux Fundamentals

> Course: **Linux Fundamentals & Practical Administration** (Alura)  
> Status: ✅ Complete

---

## What's Covered

This section covers the foundations every DevOps engineer needs to know about Linux — from boot to production server setup.

| Topic | Key Concepts |
|-------|-------------|
| Boot Process | BIOS/UEFI → GRUB → Kernel → Init |
| Linux Distributions | Debian, Ubuntu, Red Hat, philosophies |
| Filesystem Hierarchy (FHS) | `/etc`, `/var`, `/home`, `/bin`, `/dev` |
| File Permissions | `chmod`, `chown`, `chgrp` — symbolic & octal |
| Package Management | `apt-get`, `apt-cache`, `dpkg` |
| Shell Scripting | Variables, pipes, redirects, `#!/bin/bash` |
| Task Automation | `crontab` — scheduling with 5-field syntax |
| Networking | `ping`, `nslookup`, `ifconfig`, IPv4 vs IPv6 |
| User & Group Management | `useradd`, `usermod`, `passwd`, `sudo` |
| Security & Logs | `tail -f`, `journalctl`, `/var/log` |
| Web Server | Nginx — install, manage, test with `systemctl` |

---

## ⚙️ Prerequisites

- **OS:** Ubuntu 20.04+ or Debian 11+ *(all scripts tested on Ubuntu 22.04)*
- **Required packages** — install if not already present:

```bash
sudo apt update && sudo apt install -y net-tools curl vim nginx
```

- **Execution permissions** — run this once after cloning:

```bash
chmod +x scripts/*.sh
```

- **sudo access:** `system-monitor.sh` and `log-watcher.sh` read system files that may require elevated permissions on some distros.

---

## 📁 What's in This Folder

```
01-linux-fundamentals/
├── README.md          ← you are here
├── cheatsheet.md      ← quick command reference for all topics
└── scripts/
    ├── hello-linux.sh     ← first shell script (prints system info)
    ├── backup.sh          ← automated backup — designed for crontab
    ├── system-monitor.sh  ← disk, memory, uptime, top processes
    └── log-watcher.sh     ← security log scanner with journalctl
```

---

## 🚀 How to Use the Scripts

```bash
# Clone the repo
git clone https://github.com/your-username/devops-roadmap.git
cd devops-roadmap/01-linux-fundamentals/scripts

# Make scripts executable
chmod +x *.sh

# Run hello-linux
./hello-linux.sh

# Run system monitor
./system-monitor.sh

# Run log watcher (last 30 minutes)
./log-watcher.sh 30

# Run backup (source → destination)
./backup.sh /home/user /tmp/backups
```

---

---

## 📤 Expected Output

### `hello-linux.sh`

```
============================================
         Hello, Linux World! 🐧
============================================

  Date     : Mon Jun  8 14:23:01 UTC 2026
  User     : vitor
  Hostname : debian-server
  Directory: /home/vitor/scripts
  Shell    : /bin/bash

============================================
```

### `backup.sh`

```
[INFO] Starting backup...
[INFO] Source    : /home/vitor
[INFO] Destination: /tmp/backups/backup_2026-06-08_14-23-01
[INFO] Timestamp : 2026-06-08_14-23-01

[SUCCESS] Backup completed: /tmp/backups/backup_2026-06-08_14-23-01
[INFO] Cleaning up backups older than 7 days in /tmp/backups...
[INFO] Cleanup done.
[INFO] Finished at: Mon Jun  8 14:23:05 UTC 2026
```

### `system-monitor.sh`

```
========================================
  System Monitor Report
  Mon Jun  8 14:23:01 UTC 2026
========================================

📦 Disk Usage
---
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        20G  4.2G   15G  22% /

🧠 Memory Usage
---
              total        used        free
Mem:           1.9G        812M        1.1G
Swap:          975M          0B        975M

⏱  Uptime & Load Average
---
 14:23:01 up 2 days, 3:12, 1 user, load average: 0.05, 0.03, 0.01

🔥 Top 5 Processes (by CPU)
---
USER       PID  %CPU %MEM COMMAND
root         1   0.0  0.3 /sbin/init
...

🌐 Listening Ports (TCP)
---
tcp  0.0.0.0:22   LISTEN   sshd
tcp  0.0.0.0:80   LISTEN   nginx
```

### `log-watcher.sh`

```
========================================
  Log Watcher
  Scanning last 10 minutes — Mon Jun  8 14:23:01 UTC 2026
========================================

📋 Recent System Events (last 10 min)
---
Jun 8 14:20:15 hostname systemd[1]: Started Session 4 of user vitor.
Jun 8 14:21:03 hostname sshd[1234]: Accepted publickey for vitor

🚨 Failed Login Attempts
---
No failed login attempts found.

🔐 Auth Log (last 15 lines)
---
Jun 8 14:20:15 hostname sshd[1234]: Accepted publickey for vitor from 192.168.1.10

🛡  Sudo Commands Used
---
Jun 8 14:22:01 hostname sudo: vitor : COMMAND=/usr/bin/apt update
```

> **Tip:** If output looks different on your machine, that's normal — system state varies. What matters is that the script runs without errors.

---

## 🔑 Key Takeaways

- Linux permissions follow a **user / group / others** model — understand `chmod 755` before anything else
- Everything in Linux is a file — hardware devices (`/dev/video0`), config files (`/etc/nginx`), even processes (`/proc`)
- Shell scripts are the glue of DevOps — `crontab` + a `.sh` file = basic automation
- `journalctl` is your best friend for debugging a production server

---

[← Back to main roadmap](../README.md)
