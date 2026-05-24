---
name: project-manager
description: Orchestrates a multi-skill, multi-agent project — structuring the workspace, managing context across sessions via documentation, a memory layer, and git, and routing work to the right skill at each phase (research, planning, implementation, feedback). Use when starting or coordinating a larger project, working across multiple sessions, or mentions "project setup", "orchestrate", "manage this project", or "프로젝트 관리".
---

# Project Manager

The coordinating skill for non-trivial projects. It sets up the workspace, keeps context coherent across agents and sessions, and routes each phase of work to the appropriate skill.

## 1. Establish the project frame

At the start, pin down and write these down (in the workspace, not just in chat):

- **Project overview** — what we're building and why; the success criteria.
- **Directory structure** — how the workspace is organized and where things live.

Treat both as living documents; update them as the project evolves.

## 2. Context management

Context that lives only in one chat is lost the moment the session ends. Persist it deliberately:

1. **Hierarchical folders with `CLAUDE.md`.** Organize the workspace into nested folders. Every folder gets a `CLAUDE.md` describing its contents; update it whenever the contents change.
2. **Memory layer.** Record key actions and findings to a persistent memory layer (e.g. `/memory` files or an MCP memory server) as the work happens — not in a batch at the end.
3. **Git.** Track core issues and deliverables in version control so history and rationale are recoverable.
4. **Cross-reference.** Other agents and future sessions should actively read (2) and (3) before acting, rather than reconstructing context from scratch.
5. **Reflections.** When the user asks for a retrospective on a specific issue, record it separately in memory with a recurrence-prevention measure (see [reflector](../reflector/SKILL.md)) so the same mistake doesn't return.

## 3. Route work to the right skill

Match the project phase to the skill built for it:

### Research
- [researcher](../researcher/SKILL.md) — gather information and data from the web and documents.
- [problem-solver](../problem-solver/SKILL.md) — reframe the gathered data with first-principles, logic-tree, and MECE thinking.

### Planning
- [griller](../griller/SKILL.md) — interview the user until intent is fully aligned and refined.
- [grill-docs](../grill-docs/SKILL.md) — the same grilling, anchored to the project's documents and domain language.
- [round-table](../round-table/SKILL.md) — convene parallel agent personas for deeper, multi-perspective decisions.

### Implementation
- [karpathy-guidelines](../karpathy-guidelines/SKILL.md) — concise behavioral guardrails for writing code.

### Feedback
- [evaluator](../evaluator/SKILL.md) — separate doer from checker; spawn agents to score and critique deliverables (iterative TDD-style loop).
- [reflector](../reflector/SKILL.md) — reflect on the session and record lessons with prevention measures.
