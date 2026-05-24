# kio-skills

A composable set of [Claude Code](https://claude.com/claude-code) skills for doing serious work with an agent — from research and planning through implementation and feedback.

**Hypothesis:** a lean, well-structured harness gets the most out of the model. These skills are deliberately small and sharp. Each gives the model just enough structure to do one thing well, and they compose: a project moves from `researcher` → `griller` → `karpathy-guidelines` → `evaluator`, coordinated by `project-manager`.

## Install

### Option A — Claude Code plugin (recommended)

From within Claude Code:

```
/plugin marketplace add jsk4581/kio-skills
/plugin install kio-skills@kio-skills
```

This makes all nine skills available across your projects.

### Option B — Manual

Copy any skill folder into your project's `.claude/skills/` (or `~/.claude/skills/` for global use):

```bash
git clone https://github.com/jsk4581/kio-skills.git
cp -r kio-skills/skills/researcher ~/.claude/skills/
```

A skill triggers automatically when its `description` matches your request, or you can invoke one by name.

## Skills

Grouped by the phase of work they serve.

### Research
| Skill | What it does |
| --- | --- |
| [`researcher`](./skills/researcher/SKILL.md) | Deep research across web and documents; synthesizes sources into organized, cited insights. |
| [`problem-solver`](./skills/problem-solver/SKILL.md) | Reframes a problem with first-principles, MECE, and why-what-how logic trees before solving it. |

### Planning
| Skill | What it does |
| --- | --- |
| [`griller`](./skills/griller/SKILL.md) | Interviews you relentlessly, one question at a time, until your plan's intent is fully explicit. |
| [`grill-docs`](./skills/grill-docs/SKILL.md) | Grilling anchored to your project's domain language and docs; updates `CONTEXT.md` and ADRs inline. |
| [`round-table`](./skills/round-table/SKILL.md) | Convenes parallel agent personas to debate a decision from genuinely conflicting perspectives. |

### Implementation
| Skill | What it does |
| --- | --- |
| [`karpathy-guidelines`](./skills/karpathy-guidelines/SKILL.md) | Behavioral guardrails for coding: think first, keep it simple, change surgically, verify against goals. |

### Feedback
| Skill | What it does |
| --- | --- |
| [`evaluator`](./skills/evaluator/SKILL.md) | Separates doer from checker; spawns agents to validate and critique deliverables in a TDD-style loop. |
| [`reflector`](./skills/reflector/SKILL.md) | Reviews the session for mistakes and friction, recording each with a recurrence-prevention measure. |

### Orchestration
| Skill | What it does |
| --- | --- |
| [`project-manager`](./skills/project-manager/SKILL.md) | Sets up the workspace, manages context across sessions, and routes each phase to the right skill above. |

## Philosophy

Three ideas run through every skill here:

- **Give the model success criteria.** Strong, verifiable goals let an agent loop independently; vague ones force constant clarification.
- **The context window is a shared resource.** Skills stay short and push detail into on-demand reference files, so the model spends its attention on your problem, not on boilerplate.
- **Separate doing from judging.** Fresh agents catch what the producer rationalized away — grill the plan before building, evaluate the result after.

## License & attribution

MIT — see [LICENSE](./LICENSE).

`griller` and `grill-docs` are adapted from [Matt Pocock's skills](https://github.com/mattpocock/skills) (MIT). `karpathy-guidelines` is adapted from [andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills) (MIT), itself derived from Andrej Karpathy's observations on LLM coding pitfalls. Full credits in [ATTRIBUTION.md](./ATTRIBUTION.md).
