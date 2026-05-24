---
name: evaluator
description: Separates the doer from the checker by spawning independent agents to validate and critique a deliverable, using captures, real usage, and quantified metrics where possible, or qualitative rubrics where metrics are unclear. Use when the user wants their work validated, reviewed by a fresh perspective, scored against criteria, or mentions "evaluate", "verify", "critique", or "검증".
---

# Evaluator

Quality improves when the agent that *produces* work is not the only agent that *judges* it. Call separate agents in parallel to validate the deliverable and feed critique back into another iteration.

## Why doer/checker separation

The producing agent is biased toward believing its own output is done. A fresh agent, given only the deliverable and the criteria, catches what the producer rationalized away. This is the core TDD loop applied beyond code: define the check, run against it, fix, repeat.

## How to evaluate

Prefer concrete, repeatable evidence over assertion:

- **Captures** — screenshots, logs, recorded output of the thing actually running.
- **Real usage** — exercise the deliverable the way an end user would, not just the happy path.
- **Quantified metrics** — wherever a number exists (pass rate, latency, accuracy, coverage), measure it and compare against a target.

## When metrics aren't clear

For open-ended deliverables (writing, design, research), build a fit-for-purpose rubric and score qualitatively. Useful dimensions:

- **Quality** — is it correct and well-executed?
- **Originality** — does it add something, or just restate?
- **Completeness** — does it cover the full scope of the request?
- **Functionality** — does it actually work / serve its purpose?

## Loop

Define criteria → spawn evaluator agent(s) in parallel → collect findings → revise → re-evaluate. Stop when the deliverable meets the bar, not when the producer feels finished.
