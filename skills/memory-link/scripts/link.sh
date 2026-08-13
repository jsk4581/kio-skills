#!/usr/bin/env bash
# Symlink this project's Claude Code auto-memory directory and the global
# CLAUDE.md into the project root, so both are visible and editable in place.
#
# usage: link.sh [--unlink] [project_dir]
set -euo pipefail

UNLINK=0
PROJECT_DIR=""
for arg in "$@"; do
  case "$arg" in
    --unlink) UNLINK=1 ;;
    -h|--help) echo "usage: link.sh [--unlink] [project_dir]"; exit 0 ;;
    *) PROJECT_DIR="$arg" ;;
  esac
done

PROJECT_DIR="$(cd "${PROJECT_DIR:-$PWD}" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

MEM_LINK="$PROJECT_DIR/claude-memory"
GLOBAL_LINK="$PROJECT_DIR/CLAUDE.global.md"

if [ "$UNLINK" = 1 ]; then
  for link in "$MEM_LINK" "$GLOBAL_LINK"; do
    if [ -L "$link" ]; then
      rm "$link"
      echo "removed ${link##*/}"
    elif [ -e "$link" ]; then
      echo "skip: $link exists but is not a symlink" >&2
    fi
  done
  exit 0
fi

for link in "$MEM_LINK" "$GLOBAL_LINK"; do
  if [ -e "$link" ] && [ ! -L "$link" ]; then
    echo "error: $link already exists and is not a symlink; move it aside first" >&2
    exit 1
  fi
done

# Claude Code derives the per-project directory name from the project path by
# replacing every non-alphanumeric character with '-', preserving case
# (e.g. /home/kio/workspace/job_is -> -home-kio-workspace-job-is).
# sed must run in a UTF-8 locale so multibyte characters map to one '-' each.
slug="$(printf '%s' "$PROJECT_DIR" | sed 's/[^A-Za-z0-9]/-/g')"
PROJ_META_DIR="$CLAUDE_DIR/projects/$slug"
MEM_DIR="$PROJ_META_DIR/memory"

if [ ! -d "$PROJ_META_DIR" ]; then
  echo "note: $PROJ_META_DIR does not exist yet (Claude Code hasn't run in this directory); creating it" >&2
fi
mkdir -p "$MEM_DIR"

ln -sfn "$MEM_DIR" "$MEM_LINK"
echo "claude-memory -> $MEM_DIR"

if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  ln -sfn "$CLAUDE_DIR/CLAUDE.md" "$GLOBAL_LINK"
  echo "CLAUDE.global.md -> $CLAUDE_DIR/CLAUDE.md"
else
  echo "note: $CLAUDE_DIR/CLAUDE.md not found; skipped the global link" >&2
fi

# Memory and global instructions are private harness files — keep the links
# out of version control.
if git -C "$PROJECT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  GITIGNORE="$PROJECT_DIR/.gitignore"
  for entry in "/claude-memory" "/CLAUDE.global.md"; do
    if ! grep -qxF "$entry" "$GITIGNORE" 2>/dev/null; then
      printf '%s\n' "$entry" >> "$GITIGNORE"
      echo "gitignore: added $entry"
    fi
  done
fi
