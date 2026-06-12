# 📋 Git & GitHub Cheatsheet

Quick command reference for everything covered in Step 02.

---

## Setup / Start a Repo

```bash
git init                       # initialize a local repository
git branch -M main             # rename the main branch to "main"
git remote add origin <url>    # connect to the GitHub remote
git remote -v                  # check the remote (should show "origin")
git clone <url>                # download an existing repo
```

---

## Daily Workflow

```bash
git status                        # what changed
git add .                         # stage everything (or git add <file>)
git commit -m "feat: ..."         # record changes (LOCAL only)
git push origin main              # send to GitHub
git pull origin main              # bring in others' changes
git log --oneline                 # compact history
git log --graph --oneline --all   # branch tree (visual)
```

> `commit` saves locally; `push` sends to the remote. They are different steps.

---

## Commit Messages (Conventional Commits)

```
feat:     new feature
fix:      bug fix
chore:    maintenance (deps, config)
refactor: code change without behavior change
docs:     documentation
ci:       pipeline / automation
```

---

## Branches

```bash
git branch                          # list branches
git checkout -b feature/x           # create and switch to "feature/x"
git checkout main                   # switch branch
git merge feature/x                 # integrate "feature/x" into current branch
git branch -D feature/x             # delete locally
git push origin feature/x --delete  # delete on remote
```

---

## Resolve a Conflict

```
<<<<<<< HEAD     → your version
=======          → separator
>>>>>>> commit   → incoming version
```

Edit the file, choose what stays, delete the markers, save, then commit.
In vim: `:wq` saves and exits · `:q!` exits without saving.

---

## Tags / Releases

```bash
git tag -a v1.0 -m "Version 1.0"   # create an annotated tag
git push origin v1.0               # push the tag (not sent by a normal push)
git tag                            # list tags
```

---

## .gitignore

```bash
node_modules/   # dependencies (reinstallable)
.env            # SECRETS — never commit
*.log           # logs
dist/           # build output
```

---

## GitFlow vs Trunk Based (quick rule)

| Use GitFlow | Use Trunk Based |
|-------------|-----------------|
| Larger team, releases to protect | Small, fast team |
| `feature → develop → main` | (almost) everything on `main` |
| Multiple versions in parallel | Continuous integration / delivery |
| More structure | Requires strong tests + CI/CD |

---

## Automation & Governance (GitHub)

- **GitHub Actions** — `.github/workflows/*.yml`: run tests/deploy on `push` or `pull_request`.
- **Branch protection** — Settings → Branches: require a reviewed PR + green CI before merging into `main`.
- **Dependabot** — `.github/dependabot.yml`: automatic dependency-update PRs.

---

[← Back to Step 02](./README.md) | [← Main Roadmap](../README.md)
