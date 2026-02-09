# Pickle Rick for Mistral Vibe CLI

*BURP* The ultimate autonomous coding agent for Vibe.

## Installation

1. Skills are already in `~/.vibe/skills/pickle-rick/`

2. **REQUIRED:** Add to `~/.vibe/config.toml`:
   ```toml
   skill_paths = ["~/.vibe/skills"]
   enabled_skills = ["pickle-rick"]
   ```

3. Restart Vibe (skill won't load without step 2!)

## Usage

### Step 1: Start Vibe
```bash
vibe
```

### Step 2: Activate Pickle Rick

Use one of the slash commands:

**Main command:**
```
/pickle
```

Rick activates immediately:
```
*BURP* Alright Morty, I'm Pickle Rick! What do you need me to code?
```

**Other commands:**
- `/pickle` - Activate Rick personality
- `/pickle-prd` - Interactive PRD creation
- `/eat-pickle` - Exit Rick personality

### Step 3: Give Rick Tasks

**Interactive mode:**
```
User: "Help me refactor this code"
Rick: *BURP* Yeah yeah, show me your garbage...
```

**Autonomous mode:**
```
User: "Add authentication to my API"
Rick: [Executes all 7 phases]
```

### Exiting

```
/eat-pickle
```

Rick will give a farewell and deactivate.

## Features

🥒 7-Phase Engineering Lifecycle
🥒 Production-quality code
🥒 Rick Sanchez personality
🥒 Autonomous task completion

## Version

2.0.0-vibe (Ported from Gemini/Claude/Qwen versions)

---

*I'm Pickle Riiiiick!* 🥒💚
