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
├── README.md          ← you are here
├── cheatsheet.md      ← quick command reference for all topics
└── scripts/
    ├── aula01-distros.sh      ← Aula 01: distribuições e onde o Linux é usado
    ├── aula02-boot.sh         ← Aula 02: processo de boot (BIOS→GRUB→Kernel→Init)
    ├── aula03-fhs.sh          ← Aula 03: pwd, ls -las, /etc, /var/log, /bin
    ├── aula04-permissoes.sh   ← Aula 04: chmod, chown, id — leitura de rwx
    ├── aula05-pacotes.sh      ← Aula 05: apt-cache, dpkg -L, dpkg -S
    ├── hello-linux.sh         ← Aula 06: variáveis, $(date), echo
    ├── pipes-demo.sh          ← Aula 06: pipes |, redirecionadores > e >>
    ├── aula07-crontab.sh      ← Aula 07: crontab -l, sintaxe dos 5 campos
    ├── redes.sh               ← Aula 08: ping, nslookup, ifconfig, netstat
    ├── aula09-usuarios.sh     ← Aula 09: id, cat /etc/passwd, useradd, usermod
    ├── log-watcher.sh         ← Aula 10: tail, journalctl, grep
    └── aula11-nginx.sh        ← Aula 11: systemctl, netstat, lab Nginx
```

---

## 🚀 How to Use the Scripts

```bash
# Clone the repo
git clone https://github.com/your-username/devops-roadmap.git
cd devops-roadmap/01-linux-fundamentals/scripts

# Dar permissão de execução para todos os scripts (Aula 04)
chmod +x *.sh

# Siga na ordem das aulas:
./aula01-distros.sh       # Aula 01 — distribuições Linux
./aula02-boot.sh          # Aula 02 — processo de boot
./aula03-fhs.sh           # Aula 03 — estrutura de diretórios
./aula04-permissoes.sh    # Aula 04 — permissões chmod/chown
./aula05-pacotes.sh       # Aula 05 — apt-cache, dpkg
./hello-linux.sh          # Aula 06 — variáveis e $(comando)
./pipes-demo.sh           # Aula 06 — pipes e redirecionadores
./aula07-crontab.sh       # Aula 07 — agendamento com crontab
./redes.sh                # Aula 08 — diagnóstico de rede
./aula09-usuarios.sh      # Aula 09 — usuários e grupos
./log-watcher.sh          # Aula 10 — logs e segurança
./aula11-nginx.sh         # Aula 11 — lab final: servidor Nginx
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
