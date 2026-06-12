# 🐳 Step 02 — Docker

> Status: 🔄 In Progress

---

## What Will Be Covered

- Docker fundamentals (images, containers, layers)
- Writing a `Dockerfile`
- `docker-compose` for multi-container apps
- Volumes, networks, environment variables
- Running a Django + PostgreSQL stack in containers
- Basic container security

---

## Why Docker After Linux?

Docker containers are Linux processes. Every concept from Step 01 applies directly here:

| Linux (Step 01) | Docker (Step 02) |
|-----------------|-----------------|
| `chmod`, `chown` | `USER` in Dockerfile |
| `apt-get install` | `RUN apt-get install` in Dockerfile |
| `/etc`, `/var` | Bind mounts and volumes |
| `systemctl start nginx` | `docker run nginx` |
| Shell scripts | Container entrypoints |
| `journalctl` | `docker logs` |

---

*Coming soon. Follow the progress on [LinkedIn](#).*

[← Back to main roadmap](../README.md)
