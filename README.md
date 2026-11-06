# dotclaude

My Claude Code user config, installed into `~/.claude` so it works in cloud sessions (which only see the repo, not my machine).

- `agents/`: Explore (Sonnet, overrides built-in), Plan (Opus, medium effort, delegates to Explore), researcher, code-reviewer, test-runner (Sonnet)
- `skills/ponytail-review/`: vendored from [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) (MIT, see its LICENSE), preloaded by code-reviewer
- `CLAUDE.md`: subagent delegation rules (merged into `~/.claude/CLAUDE.md` as a managed block)

general-purpose is left on the main model on purpose.

## Cloud environment setup script

```bash
git clone --depth 1 https://github.com/mrdvto/dotclaude.git /tmp/dotclaude && bash /tmp/dotclaude/install.sh
```

## Local

```bash
bash install.sh
```

To update ponytail-review, copy `skills/ponytail-review/SKILL.md` from upstream.
