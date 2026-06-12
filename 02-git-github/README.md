# 🐙 Step 02 — Git & GitHub

> Course: **DevOps: Working with Repositories on GitHub** (Alura) — 8h
> Status: ✅ Complete

---

## What's Covered

Version control and collaboration — the backbone every DevOps workflow is built on. From the daily commit cycle to branch strategy, CI and automated deploy.

| Topic | What I learned | Key commands / concepts |
|-------|----------------|-------------------------|
| Git vs GitHub | Local version control vs cloud collaboration platform | — |
| Repository setup | Start a repo and connect it to a remote | `git init`, `git remote add origin`, `git push` |
| Daily workflow | The cycle you repeat all day | `git add`, `git commit`, `git push`, `git pull`, `git status`, `git log` |
| Commit messages | Readable history with Conventional Commits | `feat:`, `fix:`, `chore:`, `refactor:` |
| `.gitignore` | Keep secrets and junk out of the repo | `.env`, `node_modules/`, `*.log` |
| Branches | Isolate work without breaking `main` | `git checkout -b`, `git branch`, `git merge` |
| Merge & conflicts | Integrate work and resolve collisions | `<<<<<<< HEAD`, `=======`, `>>>>>>>` |
| Branch strategies | GitFlow vs Trunk Based — when to use each | `feature/ → develop → main` |
| Tags & releases | Mark shipped versions | `git tag -a v1.0`, `git push origin v1.0` |
| Issues & PRs | Organize work and collaborate | Issue/PR templates, `Closes #` |
| Automation & governance | CI, branch protection, dependency updates | GitHub Actions, branch protection, Dependabot |

---

## 🔑 Key Takeaways

- A commit message is documentation for your future self — `feat:`/`fix:`/`chore:` make history readable.
- A branch isn't a command, it's a strategy: **GitFlow** (`feature → develop → main`) for teams with releases to protect; **Trunk Based** for small, fast teams with strong tests.
- `commit` is local; `push` is remote — they are not the same thing.
- CI turns Git into a quality gate: tests run automatically on every PR, and code only merges when green.
- Branch protection makes the rule real — `main` only accepts reviewed PRs, not direct pushes.

---

## 🧭 Where I Use This (real projects)

This isn't theory — it runs in my projects:

- **NeuroMent** — real GitFlow (`feature/fix/chore → develop → main`), a PR template that enforces the flow, CI (PostgreSQL + Python matrix) and structured issue templates.
- **Production server** — automated deploy via GitHub Actions (`deploy.yml` over SSH) that only fires after CI passes.
- **Dependabot** keeping dependencies up to date across repos.

---

## 📁 What's in This Folder

```
02-git-github/
├── README.md       ← you are here
├── cheatsheet.md   ← quick command reference for all topics
└── examples/       ← real, reusable config (CI, Dependabot, PR & issue templates)
```

---

[← Back to main roadmap](../README.md)
