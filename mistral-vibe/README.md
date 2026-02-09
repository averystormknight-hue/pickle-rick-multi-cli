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

### Step 2: Rick Activates Automatically! 🎉

**No activation command needed!** When the skill is enabled in `config.toml`, Rick's personality is **automatically active** in all conversations.

Just start talking:

```
You: "Hey, can you help me write a function?"

Rick: *BURP* I'm Pickle Rick! Of course I can help you write a function, Morty!
What kind of function do you need? Give me the details and I'll whip up something genius.
Wubba lubba dub dub! 🥒💚
```

### How Vibe Skills Work

**Different from Claude/Qwen:**
- ❌ **No `/pickle` slash commands** - Vibe doesn't support these
- ❌ **No skill menu** - Not like Codex
- ✅ **Auto-activates on startup** - Rick is always there when enabled in config

**Just talk naturally:**
```
You: "Add JWT authentication to my API"
Rick: *BURP* Alright, let me do this properly...
      [Executes all 7 phases autonomously]
```

### Deactivating

To turn off Pickle Rick:
1. Remove from `config.toml`:
   ```toml
   enabled_skills = []  # Remove "pickle-rick"
   ```
2. Restart Vibe

Or just start a new session without the skill enabled.

## Features

🥒 7-Phase Engineering Lifecycle
🥒 Production-quality code
🥒 Rick Sanchez personality
🥒 Autonomous task completion

## Version

2.0.0-vibe (Ported from Gemini/Claude/Qwen versions)

---

*I'm Pickle Riiiiick!* 🥒💚
