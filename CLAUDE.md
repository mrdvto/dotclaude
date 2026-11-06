<!-- dotclaude:start -->
## Subagent delegation
- Delegate to subagents to keep the main context clean. Main session = planning, decisions, and edits.
- Searching/reading more than ~5 files or mapping unfamiliar code → Explore (run several in parallel for independent areas).
- Non-trivial feature, refactor, or multi-file change → planner first (never the built-in Plan agent), then implement.
- External docs, APIs, library versions, option comparisons → researcher.
- After non-trivial code changes → test-runner, then code-reviewer before committing.
- One focused task per subagent; give it full context in the prompt (it can't see this conversation).
- Treat subagent output as input, not truth: verify anything you'll act on.
- Don't delegate small, single-file tasks; just do them.
<!-- dotclaude:end -->
