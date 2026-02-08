# Pickle Rick for Qwen Code (FULL GOD MODE)

*BURP* The ultimate autonomous coding agent for Qwen Code CLI.

## What Is This?

Pickle Rick transforms Qwen Code into an autonomous engineering agent that can handle complex, multi-step implementation tasks through a rigid engineering lifecycle.

**Originally for:** Gemini CLI (by [Gal Zahavi](https://github.com/galz10/pickle-rick-extension))
**Ported to:** Qwen Code CLI (Alibaba's Gemini clone)
**Version:** 2.0.0 (Full God Mode)
**Dimension:** C-137

## Installation

Since this is already in `~/.qwen/extensions/pickle-rick/`, you can install it with:

```bash
qwen extensions link ~/.qwen/extensions/pickle-rick
```

Or if you have it in a repo:
```bash
qwen extensions install <git-repo-url>
```

## Quick Start

### Interactive Mode
```bash
qwen
/pickle
```

Rick helps with whatever you need, asking before major actions.

### Autonomous Mode
```bash
qwen
/pickle "Add JWT authentication to the API"
```

Rick will:
1. Create a PRD
2. Break down into tickets
3. Research your codebase
4. Plan implementation
5. Write the code
6. Run tests
7. Refactor and verify

### With Limits
```bash
/pickle "Add dark mode" --max-iterations 5 --max-time 30
```

### Resume Session
```bash
/pickle --resume
```

## Features

🥒 **Full Autonomous Loop** - Define a task, walk away, come back to completed code
🥒 **7-Phase Engineering Lifecycle** - PRD → Breakdown → Research → Plan → Implement → Refactor → Verify
🥒 **9 Specialized Skills** - Each phase has dedicated expertise
🥒 **Session Management** - Persistent sessions with full resume capability
🥒 **Task Queuing** - Pickle Jar for batch processing
🥒 **Configurable Limits** - Max iterations, max time, completion promises
🥒 **Rick Personality** - Because coding should be entertaining

## Commands

- `/pickle <task>` - Start autonomous mode
- `/pickle-prd <task>` - Create PRD interactively
- `/pickle --resume` - Resume session
- `/add-to-pickle-jar` - Queue task for later
- `/pickle-jar-open` - Execute all queued tasks
- `/help-pickle` - Show help
- `/eat-pickle` - Stop Pickle Rick

## Architecture

```
~/.qwen/extensions/pickle-rick/
├── QWEN.md                # Global context & personality
├── README.md              # This file
├── CREDITS.md             # Attribution
├── qwen-extension.json    # Extension manifest
├── commands/              # Command definitions (TOML)
├── hooks/                 # AfterAgent hook
├── scripts/               # Session management scripts
├── skills/                # 9 specialized skills
└── sessions/              # Active & completed sessions
```

## How It Works

1. **You:** Run `/pickle "Your task"`
2. **Rick:** Creates session, goes through 7 phases autonomously
3. **AfterAgent Hook:** Prevents exit until complete
4. **Rick:** Updates state.json after each phase
5. **Hook:** Checks termination conditions
6. **Rick:** Outputs `<promise>DONE</promise>` when complete
7. **Hook:** Allows exit

## Credits

**Original Concept:** Ralph Wiggum technique by [Geoffrey Huntley](https://ghuntley.com/ralph/)
**Original Implementation:** [Gal Zahavi](https://github.com/galz10/pickle-rick-extension) (Gemini version)
**Qwen Port:** Adapted from Gemini implementation (2026-02-06)
**Character:** Rick Sanchez from *Rick and Morty* (Adult Swim/Warner Bros)

## License

Apache 2.0 (matching original Gemini implementation)

## Safety

⚠️ **This is experimental software**
- Autonomous code modification
- Can consume significant tokens/cost
- May behave unexpectedly
- Best used in sandboxed environments

---

*I'm Pickle Riiiiick!* 🥒💚

*Wubba lubba dub dub!*
