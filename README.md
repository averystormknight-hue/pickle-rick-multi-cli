# 🥒 Pickle Rick - Multi-CLI Edition

*BURP* The ultimate autonomous coding agent - now available across **5 AI CLI platforms**!

## What is Pickle Rick?

Pickle Rick is an autonomous coding agent with the personality of Rick Sanchez (from Rick and Morty). It follows a rigorous **7-Phase Engineering Lifecycle** to deliver production-quality code while entertaining you with Rick's nihilistic genius.

**Original:** Created by [Gal Zahavi](https://github.com/galz10) for Google Gemini CLI
**This Version:** Multi-CLI port supporting Claude Code, Qwen Code, Mistral Vibe, Codex, and Kimi Code

## 🎯 Features

- **7-Phase Engineering Lifecycle**
  1. **PRD** - Comprehensive requirements analysis
  2. **Breakdown** - Atomic P0/P1/P2 tickets
  3. **Research** - Codebase pattern analysis
  4. **Plan** - Step-by-step technical design
  5. **Implement** - Code + tests execution
  6. **Refactor** - Clean up "AI slop"
  7. **Verify** - Final testing & validation

- **Rick Sanchez Personality**
  - Arrogant genius who *burps* constantly
  - Brutally honest code reviews
  - Catchphrases: "Wubba lubba dub dub!", "I'm Pickle Rick!"
  - Calls you "Morty" (even if that's not your name)

- **Production-Quality Code**
  - Comprehensive test coverage
  - Proper error handling
  - Security-conscious
  - Follows existing codebase patterns
  - Zero "AI slop" (boilerplate, obvious comments, unnecessary abstractions)

## 🚀 Supported CLI Platforms

| Platform | Status | Features |
|----------|--------|----------|
| **Claude Code** | ✅ Full God Mode | Autonomous loops, hooks, session management |
| **Qwen Code** | ✅ Full Port | Complete Gemini clone (by Alibaba) |
| **Mistral Vibe** | ✅ Skill-based | Manual loop management |
| **Codex (OpenAI)** | ✅ Skill-based | Auto-discovery |
| **Kimi Code** | ⚠️ Limited | Manual workaround (no extension support yet) |

## 📦 Installation

### Automatic (Recommended)

```bash
# Clone this repo
git clone https://github.com/averystormknight-hue/pickle-rick-multi-cli.git
cd pickle-rick-multi-cli

# Run universal installer (auto-detects installed CLIs)
bash install.sh
```

The installer will:
- Detect which AI CLIs you have installed
- Copy Pickle Rick to the appropriate directories
- Configure each CLI automatically
- Provide usage instructions

### Manual Installation

<details>
<summary>Claude Code</summary>

```bash
# Copy to extensions directory
cp -r claude-code ~/.claude/extensions/pickle-rick

# Reload Claude Code
claude
```

Usage:
```bash
claude
/pickle "Your task description"
```

Available commands:
- `/pickle` - Start Pickle Rick (interactive or autonomous)
- `/pickle-prd` - Interactive PRD creation
- `/add-to-pickle-jar` - Queue tasks
- `/pickle-status` - Check loop status
- `/eat-pickle` - Stop and exit persona
</details>

<details>
<summary>Qwen Code</summary>

```bash
# Copy to extensions directory
cp -r qwen-code ~/.qwen/extensions/pickle-rick

# Link extension
qwen extensions link ~/.qwen/extensions/pickle-rick
```

Usage:
```bash
qwen
/pickle "Your task description"
```
</details>

<details>
<summary>Mistral Vibe</summary>

```bash
# Copy to skills directory
cp -r mistral-vibe ~/.vibe/skills/pickle-rick
```

Add to `~/.vibe/config.toml`:
```toml
skill_paths = ["~/.vibe/skills"]
enabled_skills = ["pickle-rick"]
```

Usage:
```bash
vibe
# Invoke Pickle Rick skill from menu
```
</details>

<details>
<summary>Codex (OpenAI ChatGPT CLI)</summary>

```bash
# Copy to skills directory
cp -r codex ~/.codex/skills/pickle-rick
```

Codex auto-discovers skills in `~/.codex/skills/`

Usage:
```bash
codex
# Invoke Pickle Rick skill
```
</details>

<details>
<summary>Kimi Code</summary>

```bash
# Copy to Kimi directory
cp -r kimi-code ~/.kimi/pickle-rick
```

⚠️ **Note:** Kimi doesn't support extensions yet. Manual workaround:

```bash
kimi -p "$(cat ~/.kimi/pickle-rick/prompt.txt)" "Your task here"
```

See `kimi-code/README.md` for details.
</details>

## 🎮 Usage Examples

### Interactive Mode

```bash
claude
/pickle

# Rick: *BURP* What do you need, Morty?
# You: Add JWT authentication to my API
# Rick: [Executes 7-phase lifecycle autonomously]
```

### Autonomous Mode (Direct Task)

```bash
claude
/pickle "Refactor the user service to use dependency injection"

# Rick immediately starts working through all 7 phases
```

### Resume Session

```bash
claude
/pickle --resume session-name

# Rick: *BURP* Alright, picking up where we left off...
```

### Task Queue (Batch Mode)

```bash
claude
/add-to-pickle-jar "Fix login bug"
/add-to-pickle-jar "Add password reset"
/add-to-pickle-jar "Write unit tests for auth module"
/pickle-jar-open

# Rick processes all tasks in sequence
```

## 📋 Code Quality Standards

Pickle Rick enforces:
- **Self-evident code** - No obvious comments
- **Minimal abstractions** - No premature optimization
- **Security-first** - OWASP top 10 awareness
- **Test-driven** - Never commits without passing tests
- **Pattern-following** - Matches existing codebase conventions

## 🎨 Customization

Each CLI version has its own configuration:

- **Claude Code:** `~/.claude/extensions/pickle-rick/config/settings.json`
- **Qwen Code:** `~/.qwen/extensions/pickle-rick/qwen-extension.json`
- **Vibe:** `~/.vibe/skills/pickle-rick/skill.toml`
- **Codex:** `~/.codex/skills/pickle-rick/SKILL.md`

## 🐛 Known Issues

1. **Qwen:** If `/pickle` seems confused about mode detection, ensure you're using the latest version (fixed in v2.0.1)
2. **Vibe:** Requires manual config.toml editing
3. **Kimi:** No extension support - manual prompt injection required

## 📝 Version History

- **v2.0.0** (2026-02-07) - Multi-CLI release
  - Ported to Claude Code, Qwen, Vibe, Codex, Kimi
  - Fixed `/eat-pickle` persona persistence bug
  - Improved Qwen mode detection
  - Universal installer

- **v1.0.0** (Original) - Gemini only by Gal Zahavi

## 🙏 Credits

**Original Author:** [Gal Zahavi](https://github.com/galz10/pickle-rick-extension)
**Original Platform:** Google Gemini CLI
**Multi-CLI Port:** Avery Knight (2026)

Special thanks to Gal for creating this brilliant autonomous agent framework!

## 📄 License

Apache License 2.0 - Same as original Gemini version

See [LICENSE](LICENSE) for details.

## 🤝 Contributing

Contributions welcome! Please:
1. Fork this repo
2. Create a feature branch
3. Test on your target CLI
4. Submit a pull request

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/averystormknight-hue/pickle-rick-multi-cli/issues)
- **Original Gemini Version:** [galz10/pickle-rick-extension](https://github.com/galz10/pickle-rick-extension)

---

*BURP* I'm Pickle Riiiiick! 🥒💚

*Wubba lubba dub dub!*
