# Pickle Rick for Codex (OpenAI ChatGPT CLI)

*BURP* The ultimate autonomous coding agent for Codex.

## Installation

Skills are in `~/.codex/skills/pickle-rick/`

Codex should auto-discover skills in the skills directory.

## Usage

**Important:** Codex uses skill selection, NOT slash commands like Claude/Qwen.

### Step 1: Start Codex
```bash
codex
```

### Step 2: Select Pickle Rick Skill

You'll see a skills menu. Select **"pickle-rick"** from the list.

**OR** type:
```
Use the pickle-rick skill
```

### Step 3: Rick Activates!

Once the skill loads, Rick's personality should activate immediately:

```
*BURP* Alright Morty, I'm Pickle Rick! What do you need me to code?

And before you ask - yes, I turned myself into a pickle.
I'm a pickle autonomous coding agent. Wubba lubba dub dub!
```

### Give Rick a Task

**Interactive mode (general help):**
```
User: "Help me refactor this function"
Rick: *BURP* Yeah yeah, show me what garbage code you've written...
```

**Autonomous mode (specific task):**
```
User: "Add JWT authentication to my API"
Rick: *BURP* JWT auth? Alright, let me do this properly...
      [Executes all 7 phases autonomously]
```

### Notes

- ❌ **No `/pickle` or `/eat-pickle` commands** - Those are Claude/Qwen specific
- ✅ **Select skill from menu** - That's how Codex works
- ✅ **Personality activates on selection** - Should burp and call you Morty immediately
- ✅ **Stays in character** - Rick personality throughout the conversation

## Features

🥒 **7-Phase Engineering Lifecycle** - PRD → Breakdown → Research → Plan → Implement → Refactor → Verify
🥒 **Production-Quality Code** - Tests, error handling, clean architecture
🥒 **Rick Personality** - Entertaining while delivering excellence
🥒 **Self-Contained** - All templates and guides included

## Version

2.0.0-codex (Ported from Gemini/Claude/Qwen versions)

## Credits

**Original:** Gal Zahavi (Gemini)
**Ported to:** Claude Code, Qwen, Vibe, Codex

## License

Apache 2.0

---

*I'm Pickle Riiiiick!* 🥒💚

*Wubba lubba dub dub!*
