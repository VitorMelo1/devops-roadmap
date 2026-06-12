# 📦 Examples — Reusable GitHub Config

Real, working configuration files I use across my projects. In an actual repository these live in the `.github/` folder (and the repo root for `.gitignore`).

| File | Goes to | What it does |
|------|---------|--------------|
| `workflow-ci.yml` | `.github/workflows/` | Runs lint + tests on every push/PR (Continuous Integration) |
| `dependabot.yml` | `.github/` | Opens automatic PRs to keep dependencies updated |
| `pull_request_template.md` | `.github/` | Standardizes what every PR must describe |
| `ISSUE_TEMPLATE/bug_report.yml` | `.github/ISSUE_TEMPLATE/` | A structured bug-report form with required fields |
| `.gitignore.example` | repo root (as `.gitignore`) | Keeps secrets, dependencies and build output out of git |

> These are templates — adapt the ecosystem (`npm`, `pip`, `docker`), paths and branch names to each project.

[← Back to Step 02](../README.md)
