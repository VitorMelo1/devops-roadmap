# 🐧 Step 01 — Linux Fundamentals

> Course: **Linux Fundamentals & Practical Administration** (Alura)  
> Status: ✅ Complete

---

## What's Covered

This section covers the foundations every DevOps engineer needs to know about Linux — from boot to production server setup.

| Aula | Topic | Commands |
|------|-------|----------|
| 01–02 | Distributions & Boot | BIOS → GRUB → Kernel → Init |
| 03 | Filesystem (FHS) | `pwd`, `ls -las`, `cd`, `/etc`, `/var/log` |
| 04 | File Permissions | `chmod`, `chown`, `chgrp` |
| 05 | Package Management | `apt-get`, `apt-cache`, `dpkg` |
| 06 | Shell Scripting | `#!/bin/bash`, variables, `$(cmd)`, `\|`, `>`, `>>`, `cat`, `grep`, `sort` |
| 07 | Task Automation | `crontab -e`, `crontab -l` |
| 08 | Networking | `ping`, `nslookup`, `ifconfig`, `netstat -ntpl` |
| 09 | Users & Groups | `useradd`, `usermod`, `passwd`, `su`, `id` |
| 10 | Security & Logs | `tail`, `tail -f`, `journalctl`, `grep` |
| 11 | Web Server (Lab) | `systemctl`, `apt-get install nginx`, `netstat` |

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
├── README.md            ← you are here
├── cheatsheet.md        ← quick command reference for all topics
└── scripts/
    ├── 01-distros.sh        ← Lesson 01: distributions and Linux philosophy
    ├── 02-boot.sh           ← Lesson 02: boot process (BIOS→GRUB→Kernel→Init)
    ├── 03-fhs.sh            ← Lesson 03: pwd, ls -las, /var/log, cd
    ├── 04-permissions.sh    ← Lesson 04: chmod, id — reading rwx permissions
    ├── 05-packages.sh       ← Lesson 05: apt-cache, dpkg -L, dpkg -S
    ├── 06-variables.sh      ← Lesson 06: variables, $(date), echo
    ├── 06-pipes.sh          ← Lesson 06: pipes |, redirectors > and >>
    ├── 07-crontab.sh        ← Lesson 07: crontab -l, 5-field syntax
    ├── 08-networking.sh     ← Lesson 08: ping, nslookup, ifconfig, netstat
    ├── 09-users.sh          ← Lesson 09: id, cat /etc/passwd, useradd, usermod
    ├── 10-logs.sh           ← Lesson 10: tail, journalctl, grep
    └── 11-nginx.sh          ← Lesson 11: systemctl, netstat, Nginx lab
```

---

## 🚀 How to Use the Scripts

```bash
# Clone the repo
git clone https://github.com/your-username/devops-roadmap.git
cd devops-roadmap/01-linux-fundamentals/scripts

# Grant execution permission to all scripts (Lesson 04)
chmod +x *.sh

# Follow the lesson order:
./01-distros.sh       # Lesson 01 — Linux distributions
./02-boot.sh          # Lesson 02 — boot process
./03-fhs.sh           # Lesson 03 — directory structure
./04-permissions.sh   # Lesson 04 — chmod and permissions
./05-packages.sh      # Lesson 05 — apt-cache, dpkg
./06-variables.sh     # Lesson 06 — variables and $(command)
./06-pipes.sh         # Lesson 06 — pipes and redirectors
./07-crontab.sh       # Lesson 07 — task scheduling with crontab
./08-networking.sh    # Lesson 08 — network diagnostics
./09-users.sh         # Lesson 09 — users and groups
./10-logs.sh          # Lesson 10 — logs and security
./11-nginx.sh         # Lesson 11 — final lab: Nginx web server
```


---

## 🔑 Key Takeaways

- `#!/bin/bash` no topo — sem ela o sistema não sabe executar o script
- `$(comando)` captura a saída de qualquer comando como valor de variável
- `|` pipe encadeia comandos: saída de um vira entrada do próximo
- `>>` acumula em arquivo, `>` sobrescreve — erre uma vez, lembre para sempre
- `tail -f` e `journalctl -f` são seus melhores amigos em um servidor em produção
- `crontab -e` + um `.sh` = automação básica sem depender de ninguém

---

[← Back to main roadmap](../README.md)
