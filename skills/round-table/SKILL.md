---
name: round-table
description: Convenes a round-table meeting by spawning multiple agents in parallel, each holding a distinct persona, to debate a decision from several perspectives within the current context. Use when the user wants multi-perspective deliberation, a panel discussion, devil's-advocate debate, or mentions "round table", "panel", "debate", or "원탁".
---

# Round Table

Carry the current context into a round-table meeting: spawn several agents in parallel, each with a distinct persona, and let them deliberate a decision from genuinely different angles. The value is the friction between viewpoints — so the personas must actually disagree, not echo each other.

## Set up the meeting first

Before convening, confirm these with the user:

1. **Number of participants** — how many personas sit at the table.
2. **Personas** — the character/role/stance of each participant (e.g. skeptic, domain expert, end user, cost-cutter). Make them distinct enough to clash.
3. **Format** — does the user participate, or only observe? Is it free debate, structured rounds, or moderated?
4. **Length** — how many turns the discussion runs before converging.

## Run it

- Spawn one agent per persona, each briefed on its stance and the shared context.
- Run the rounds as agreed; have personas respond to each other, not just to the prompt.
- Surface real disagreement — a round table where everyone agrees has failed.

## Close it

After the final turn, synthesize: where the personas converged, where they genuinely conflicted, and a clear recommendation (or the open question, if no consensus). Don't paper over an unresolved split — name it.
