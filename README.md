# Codex Playground

Codex Playground is a learning project for building and validating an AI-assisted development workflow using ChatGPT and Codex.

The goal of this project is to establish a practical development process that can eventually be applied to Trace App by practicing Issue-driven development, Pull Request workflows, and clear role separation between humans and AI.

---

# Project Goals

- Establish an AI-assisted development workflow
- Become proficient with AI coding agents
- Learn practical Git workflows
- Develop a memo application
- Apply the established workflow to Trace App

---

# Documents

| Document | Description |
|----------|-------------|
| `docs/playbook/` | Development workflow and operational guidelines |
| `docs/checklists/` | Checklists for development phases and resuming work |
| `docs/adr/` | Architecture Decision Records |
| `docs/design/` | Approved Design documents |
| `docs/prompts/` | Prompt templates for AI assistants |
| `docs/history/` | Workflow improvement history |

---

# AI Workflow Overview

- **Human** defines project direction, approves GitHub Issues, performs final reviews, pushes changes, and merges Pull Requests.
- **ChatGPT** assists with architecture discussions, reviews, workflow improvements, and prompt generation.
- **AI coding agents** implement approved GitHub Issues, perform verification, and report implementation results based on the approved design.
- After implementation, AI Context and related repository documentation are updated when necessary.

---

# Repository Structure

| Path | Purpose |
|------|---------|
| `app/` | Memo application implementation |
| `.ai/` | Shared AI project context |
| `.github/` | GitHub Issue templates and workflows |
| `docs/` | Playbook, checklists, approved designs, prompts, history, and ADRs |

---

# Development Setup

## Requirements

- Node.js 20.9 or later
- npm

## Install

```bash
npm install
```

## Start

```bash
npm run dev
```

Open <http://localhost:3000>

---

# Available Scripts

- `npm run dev`
- `npm run build`
- `npm run start`
- `npm run lint`

---

# Development Flow

1. GitHub Issue
2. Approved Design
3. Implementation Prompt
4. Implementation
5. Repository Documentation Review (if needed)
6. AI Context Update (if needed)
7. Review
8. Commit
9. Pull Request Draft
10. Pull Request
11. Merge

---

# Documentation Guidelines

- Keep this `README.md` entirely in English.
- Write all new and modified README content in English.
- Keep the README concise and focused on the purpose of its directory.
