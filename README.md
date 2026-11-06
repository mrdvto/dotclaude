# dotclaude

My Claude Code user config, installed into `~/.claude` so it works in cloud sessions (which only see the repo, not my machine).

- `agents/`: Explore (Sonnet, overrides built-in), planner (Opus, medium effort; replaces built-in Plan, which cannot be overridden by name. Cloud caps subagent nesting at 1, so the main session runs Explore and passes findings to planner), researcher, code-reviewer, test-runner (Sonnet)
- `skills/ponytail-review/`: vendored from [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) (MIT, see its LICENSE), preloaded by code-reviewer
- `CLAUDE.md`: subagent delegation rules (merged into `~/.claude/CLAUDE.md` as a managed block)

general-purpose is left on the main model on purpose.

## Cloud environment setup script

Cloud environments cache the setup script's result, so new commits here are NOT picked up until the script text changes. **After every push, bump the `version` comment in the environment's setup script.**

```bash
# dotclaude version 3
echo "setup ran $(date)" >> /root/dotclaude-setup.log
rm -rf /opt/dotclaude && git clone --depth 1 https://github.com/mrdvto/dotclaude.git /opt/dotclaude >> /root/dotclaude-setup.log 2>&1 && bash /opt/dotclaude/install.sh >> /root/dotclaude-setup.log 2>&1
git -C /opt/dotclaude log --oneline -1 >> /root/dotclaude-setup.log 2>&1
```

## Local

```bash
bash install.sh
```

To update ponytail-review, copy `skills/ponytail-review/SKILL.md` from upstream.
