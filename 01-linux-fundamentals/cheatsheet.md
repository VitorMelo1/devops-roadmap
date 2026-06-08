# 📋 Linux Cheatsheet

Quick command reference for everything covered in Step 01.

---

## Navigation & Filesystem

```bash
pwd                    # print working directory
ls -las                # list with details (permissions, size, owner)
cd /etc                # change to /etc
cd ~                   # go to home directory
cd ..                  # go up one level
```

### Filesystem Hierarchy (FHS)

| Directory | Purpose |
|-----------|---------|
| `/etc` | System and service configuration files |
| `/var/log` | System logs |
| `/usr/bin` | Installed program binaries |
| `/bin` | Essential system commands (ls, cp, mv) |
| `/home` | User home directories |
| `/tmp` | Temporary files (cleared on reboot) |
| `/dev` | Device files (camera, disk, etc.) |
| `/boot` | Kernel and GRUB files |

---

## File Permissions

```bash
# View permissions
ls -las file.txt

# chmod — symbolic
chmod u+x script.sh        # add execute for owner
chmod g-w file.txt         # remove write from group
chmod o+r file.txt         # add read for others
chmod ug+r file.txt        # add read for owner and group

# chmod — octal
chmod 755 script.sh        # rwx r-x r-x
chmod 700 private.txt      # rwx --- ---
chmod 400 key.pem          # r-- --- ---  (SSH private key)
chmod 644 config.txt       # rw- r-- r--

# chown / chgrp
chown user:group file.txt  # change owner and group
chgrp www-data file.txt    # change group only

# Check identity
id                         # shows UID, GID, all groups
```

### Octal Permission Table

| Octal | Binary | Permissions |
|-------|--------|-------------|
| 7 | 111 | rwx |
| 6 | 110 | rw- |
| 5 | 101 | r-x |
| 4 | 100 | r-- |
| 0 | 000 | --- |

---

## Package Management (APT / dpkg)

```bash
sudo apt update                      # refresh repository list
sudo apt-get install nginx           # install package
sudo apt-get remove vim              # remove package
apt-cache search vim                 # search repository
apt-cache search vim | grep vim      # filtered search

dpkg -L nginx                        # list all files from package
dpkg -S /usr/bin/vim                 # find which package owns a file
```

---

## Shell & Data Streams

```bash
# Pipes and redirects
cmd1 | cmd2                  # pipe: stdout of cmd1 → stdin of cmd2
command > output.txt         # redirect stdout (overwrite)
command >> output.txt        # redirect stdout (append)
command 2> errors.txt        # redirect stderr
command > output.txt 2>&1    # redirect both stdout and stderr

# Useful pipeline commands
cat /etc/passwd | grep login | sort | wc -l
grep -n "text" file.txt      # search with line numbers
sort                         # sort alphabetically
wc -l                        # count lines
```

---

## Shell Scripting

```bash
#!/bin/bash                  # shebang — required on first line

# Variables
NAME="DevOps"
DATE=$(date)                 # capture command output
echo "Hello, $NAME — $DATE"

# Make executable and run
chmod +x script.sh
./script.sh
```

---

## Crontab

```bash
crontab -e                   # edit cron jobs
crontab -l                   # list active cron jobs

# Syntax: min hour day month weekday command
# ┌─── minute    (0–59)
# │ ┌─ hour      (0–23)
# │ │ ┌ day      (1–31)
# │ │ │ ┌ month  (1–12)
# │ │ │ │ ┌ weekday (0=Sun … 6=Sat)
# * * * * * /path/to/script.sh
```

### Common Patterns

```bash
0 2 * * *       # every day at 02:00
*/5 * * * *     # every 5 minutes
0 */5 * * *     # every 5 hours
30 8 * * 1-5    # Mon–Fri at 08:30
0 9-18 * * 1-5  # Mon–Fri, every hour from 9am to 6pm
```

---

## Networking

```bash
ping google.com                      # test connectivity (Ctrl+C to stop)
nslookup alura.com.br                # resolve DNS → IP
ifconfig                             # list network interfaces
ifconfig -a                          # include inactive interfaces
netstat -ntpl                        # list TCP ports in LISTEN state
telnet localhost 80                  # test HTTP port manually

# Configure interface (requires sudo)
sudo ifconfig eth0:1 10.0.2.16 netmask 255.255.255.0 up
sudo ifconfig eth0:1 10.0.2.16 netmask 255.255.255.0 down
```

---

## User & Group Management

```bash
sudo useradd -m username             # create user with home dir
sudo passwd username                 # set password
su username                          # switch to user
sudo usermod -aG sudo username       # add user to sudo group
sudo usermod -s /bin/bash username   # change user shell
cat /etc/passwd                      # list all users
id                                   # show current user identity
```

---

## Security & Logs

```bash
# Real-time monitoring
tail -f /var/log/syslog              # stream a specific log
tail -f /var/log/*                   # stream ALL logs simultaneously
journalctl -f                        # stream all system events

# Historical queries
journalctl --since "10 minutes ago"
journalctl --since "1 hour ago"
journalctl --since today

# Log directories
ls /var/log/                         # list available logs
```

---

## Web Server (Nginx)

```bash
sudo apt-get install nginx           # install
sudo systemctl status nginx          # check status
sudo systemctl start nginx           # start
sudo systemctl stop nginx            # stop
sudo systemctl restart nginx         # restart
sudo systemctl enable nginx          # start on boot

netstat -ntpl                        # confirm port 80 is open
telnet localhost 80                  # test response

# Edit default page
sudo vim /var/www/html/index.nginx-debian.html
```

---

[← Back to Step 01](./README.md) | [← Main Roadmap](../README.md)
