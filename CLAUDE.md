# Project Orchestration

Guidelines for running a non-trivial, multi-session project with an agent. Copy
this file into your own project's `CLAUDE.md` so it is always in context — it
sets up the workspace, keeps context coherent across agents and sessions, and
routes each phase of work to the right [kio-skill](./README.md).

## 1. Establish the project frame

At the start, pin these down **in the workspace, not just in chat**:

- **Project overview** — what we're building and why; the success criteria.
- **Directory structure** — how the workspace is organized and where things live.

Treat both as living documents; update them as the project evolves.

## 2. Context management

Context that lives only in one chat is lost the moment the session ends. Persist
it deliberately:

1. **Hierarchical folders with `CLAUDE.md`.** Organize the workspace into nested
   folders. Every folder gets a `CLAUDE.md` describing its contents; update it
   whenever the contents change.
2. **mem0.** Record key actions and findings to [mem0](https://mem0.ai) — the
   persistent memory layer — as the work happens, not in a batch at the end.
   Use the mem0 MCP server / CLI so memories survive across sessions and agents.
3. **Git.** Track core issues and deliverables in version control so history and
   rationale are recoverable.
4. **Cross-reference.** Other agents and future sessions should actively read
   mem0 (2) and git history (3) before acting, rather than reconstructing
   context from scratch.
5. **Reflections.** When the user asks for a retrospective on a specific issue,
   record it to mem0 separately with a recurrence-prevention measure (see the
   [reflector](./skills/reflector/SKILL.md) skill) so the same mistake doesn't
   return.

## 3. Route work to the right skill

Match the project phase to the skill built for it:

### Research
- [researcher](./skills/researcher/SKILL.md) — gather information and data from the web and documents.
- [problem-solver](./skills/problem-solver/SKILL.md) — reframe the gathered data with first-principles, logic-tree, and MECE thinking.

### Planning
- [griller](./skills/griller/SKILL.md) — interview the user until intent is fully aligned and refined.
- [grill-docs](./skills/grill-docs/SKILL.md) — the same grilling, anchored to the project's documents and domain language.
- [round-table](./skills/round-table/SKILL.md) — convene parallel agent personas for deeper, multi-perspective decisions.

### Implementation
- [karpathy-guidelines](./skills/karpathy-guidelines/SKILL.md) — concise behavioral guardrails for writing code.

### Feedback
- [evaluator](./skills/evaluator/SKILL.md) — separate doer from checker; spawn agents to score and critique deliverables (iterative TDD-style loop).
- [reflector](./skills/reflector/SKILL.md) — reflect on the session and record lessons with prevention measures.
