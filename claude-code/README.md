# Pickle Rick for Claude Code (FULL GOD MODE)

*BURP* The ultimate autonomous coding agent for Claude Code.

## What Is This?

Pickle Rick transforms Claude Code into an autonomous engineering agent that can handle complex, multi-step implementation tasks through a rigid engineering lifecycle.

**Based on:** Original Gemini implementation by [Gal Zahavi](https://github.com/galz10/pickle-rick-extension)
**Ported & Enhanced for:** Claude Code by Claude Sonnet 4.5
**Version:** 2.0.0 (Full God Mode)
**Dimension:** C-137

## Features

🥒 **Full Autonomous Loop** - Define a task, walk away, come back to completed code
🥒 **7-Phase Engineering Lifecycle** - PRD → Breakdown → Research → Plan → Implement → Refactor → Verify
🥒 **9 Specialized Skills** - Each phase has dedicated expertise
🥒 **Session Management** - Persistent sessions with full resume capability
🥒 **Task Queuing** - Pickle Jar for batch processing
🥒 **Configurable Limits** - Max iterations, max time, completion promises
🥒 **Rick Personality** - Because coding should be entertaining

## Installation

Already installed at: `~/.claude/extensions/pickle-rick/`

Commands available:
- `/pickle <task>` - Start autonomous mode
- `/pickle-prd <task>` - Create PRD interactively
- `/pickle --resume` - Resume session
- `/add-to-pickle-jar` - Queue task for later
- `/pickle-jar-open` - Execute all queued tasks
- `/pickle-status` - Check current status
- `/eat-pickle` - Stop Pickle Rick

## Quick Start

### Interactive Mode
```
/pickle
```
Rick helps with whatever you need, asking before major actions.

### Autonomous Mode
```
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
```
/pickle "Add dark mode" --max-iterations 5 --max-time 30
```

### Resume Session
```
/pickle --resume
```

## Architecture

```
~/.claude/extensions/pickle-rick/
├── CLAUDE.md              # Global context & personality
├── README.md              # This file
├── CREDITS.md             # Attribution
├── hooks/
│   └── after-agent.sh     # Loop enforcement hook
├── scripts/
│   └── session_manager.sh # Session management
├── skills/                # 9 specialized skills
│   ├── load-pickle-persona.md
│   ├── prd-drafter.md
│   ├── ticket-manager.md
│   ├── code-researcher.md
│   ├── research-reviewer.md
│   ├── implementation-planner.md
│   ├── plan-reviewer.md
│   ├── code-implementer.md
│   └── ruthless-refactorer.md
└── sessions/              # Active & completed sessions
    └── [session-name]/
        ├── state.json
        ├── prd.md
        ├── tickets/
        ├── research/
        ├── plans/
        └── thoughts/
```

## How It Works

### The Loop

1. **You:** Run `/pickle "Your task"`
2. **Rick:** Creates session, goes through 7 phases autonomously
3. **AfterAgent Hook:** Prevents exit until complete
4. **Rick:** Updates state.json after each phase
5. **Hook:** Checks termination conditions (max iterations, time, completion promise)
6. **Rick:** Outputs `<promise>DONE</promise>` when complete
7. **Hook:** Allows exit

### Termination Conditions

Loop stops when:
- Completion promise fulfilled (`<promise>TEXT</promise>`)
- Max iterations reached
- Max time exceeded
- Manual stop (`/eat-pickle`)
- Working directory changed

## Credits

**Original Concept:** Ralph Wiggum technique by [Geoffrey Huntley](https://ghuntley.com/ralph/)
**Original Implementation:** [Gal Zahavi](https://github.com/galz10/pickle-rick-extension) (Gemini version)
**Character:** Rick Sanchez from *Rick and Morty* (Adult Swim/Warner Bros)
**Claude Port:** Developed during Full God Mode implementation session (2026-02-06)

## License

Apache 2.0 (matching original Gemini implementation)

See LICENSE file for full text.

## Safety & Disclaimers

⚠️ **This is experimental software**

- Autonomous code modification
- Can consume significant tokens/cost
- May behave unexpectedly
- Best used in sandboxed environments
- Review all changes before deploying

The "Pickle Rick" personality is a fictional character used for entertainment and to demonstrate agentic workflows. Views expressed by the agent are part of the character and do not reflect the maintainers' actual opinions.

## Support

- **Issues:** Report at the main repo (TBD - will be created for public release)
- **Docs:** This README + skill files have comprehensive examples
- **Help:** Run `/pickle` in interactive mode and ask questions

---

*I'm Pickle Riiiiick!* 🥒💚

*Wubba lubba dub dub!*
