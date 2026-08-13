---
name: memory-link
description: Symlinks the project's Claude Code auto-memory directory (~/.claude/projects/<slug>/memory/) and the global ~/.claude/CLAUDE.md into the project root so memory is visible and editable in place, with .gitignore guards. Use when the user wants to surface or expose Claude Code memory in a project, link or unlink memory, or mentions "memory link", "expose memory", or "메모리 링크".
---

# Memory Link

Claude Code keeps its per-project auto-memory in `~/.claude/projects/<slug>/memory/` — where `<slug>` is the absolute project path with every non-alphanumeric character replaced by `-` — and its global instructions in `~/.claude/CLAUDE.md`. Both live outside the project, effectively hidden. This skill surfaces them as two symlinks in the project root:

- `claude-memory/` → the project's auto-memory directory
- `CLAUDE.global.md` → `~/.claude/CLAUDE.md`

## Quick start

Run the bundled script from this skill's base directory — don't reimplement it inline:

```bash
bash scripts/link.sh                      # link the current directory's project
bash scripts/link.sh /path/to/project     # link another project
bash scripts/link.sh --unlink             # remove the two symlinks
```

The script computes the slug, creates the memory directory if the project has never been opened in Claude Code, refuses to clobber files that exist but aren't symlinks, and — when the project is a git repo — appends `/claude-memory` and `/CLAUDE.global.md` to `.gitignore` if missing.

## After linking, tell the user

- Both link targets. An empty `claude-memory/` just means nothing has been memorized for that project yet.
- That the links are gitignored: memory and global instructions are private harness files and must never be committed.
- Edits through the symlinks write to the real files, so changes take effect for Claude Code immediately.

## Notes

- Respects `CLAUDE_CONFIG_DIR` when set; defaults to `~/.claude`.
- Slug rule is verified behavior: `/home/kio/workspace/job_is` → `-home-kio-workspace-job-is`; case is preserved, and each multibyte character becomes one `-`.
- `--unlink` removes only the symlinks; the real memory directory and `.gitignore` entries are left untouched.
