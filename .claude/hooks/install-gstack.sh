#!/usr/bin/env bash
# Installs gstack (https://github.com/garrytan/gstack) at the start of every
# Claude Code session. Cloud sessions start from a clean machine, so this
# runs each time; on a machine where gstack is already installed it does nothing.
set -uo pipefail

GSTACK_DIR="$HOME/.claude/skills/gstack"

if [ -f "$GSTACK_DIR/.setup-done" ] || [ -e "$HOME/.claude/skills/office-hours/SKILL.md" ]; then
  exit 0
fi

{
  # Bun is required by gstack's setup.
  if ! command -v bun >/dev/null 2>&1; then
    npm install -g bun@latest >/dev/null 2>&1 || curl -fsSL https://bun.sh/install | bash
    export PATH="$HOME/.bun/bin:$(npm prefix -g 2>/dev/null)/bin:$PATH"
  fi

  mkdir -p "$HOME/.claude/skills"
  if [ ! -d "$GSTACK_DIR/.git" ]; then
    git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git "$GSTACK_DIR"
  fi

  cd "$GSTACK_DIR" && ./setup </dev/null && touch "$GSTACK_DIR/.setup-done"
} >"$HOME/.gstack-install.log" 2>&1

if [ -f "$GSTACK_DIR/.setup-done" ]; then
  echo "gstack installed."
else
  echo "gstack install failed — see ~/.gstack-install.log"
fi
exit 0
