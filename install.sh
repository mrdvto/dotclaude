#!/usr/bin/env bash
# Installs dotclaude into ~/.claude (agents, skills, global CLAUDE.md block). Safe to re-run.
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
mkdir -p "$DEST/agents" "$DEST/skills"
rm -f "$DEST/agents/Plan.md"  # old override that never took effect
cp "$SRC"/agents/*.md "$DEST/agents/"
cp -r "$SRC"/skills/. "$DEST/skills/"
# Replace (or add) the managed block in the global CLAUDE.md, leaving anything else intact.
TARGET="$DEST/CLAUDE.md"; touch "$TARGET"
awk '/<!-- dotclaude:start -->/{skip=1} !skip{print} /<!-- dotclaude:end -->/{skip=0}' "$TARGET" \
  | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}' > "$TARGET.tmp"
{ cat "$TARGET.tmp"; [ -s "$TARGET.tmp" ] && echo; cat "$SRC/CLAUDE.md"; } > "$TARGET"
rm -f "$TARGET.tmp"
echo "dotclaude installed into $DEST"
