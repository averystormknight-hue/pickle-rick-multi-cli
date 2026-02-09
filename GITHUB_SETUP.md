# GitHub Setup Instructions

Your repo is committed and ready to push! Here's how to get it on GitHub.

## Step 1: Create GitHub Repository

1. Go to: https://github.com/new
2. Fill in:
   - **Repository name:** `pickle-rick-multi-cli`
   - **Description:** `🥒 Pickle Rick autonomous coding agent - Multi-CLI edition (Claude, Qwen, Vibe, Codex, Kimi)`
   - **Visibility:** Public
   - **❌ DO NOT** initialize with README, .gitignore, or license (we already have these)
3. Click "Create repository"

## Step 2: Push to GitHub

GitHub will show you commands. Use these:

```bash
cd ~/Dev/pickle-rick-multi-cli

# Add remote
git remote add origin https://github.com/averystormknight-hue/pickle-rick-multi-cli.git

# Push to GitHub
git push -u origin main
```

Replace `averystormknight-hue` with your actual GitHub username.

## Step 3: Add Repository Topics

On GitHub, click "⚙️ Settings" → scroll to "Topics":

Add these topics:
```
ai
coding-agent
autonomous-agent
claude-code
qwen
rick-and-morty
pickle-rick
cli-tool
gemini
developer-tools
```

## Step 4: Create First Release (Optional)

1. Go to: **Releases** → **Create a new release**
2. Click "Choose a tag" → type `v2.0.0` → "Create new tag"
3. **Release title:** `Pickle Rick Multi-CLI v2.0.0 - Initial Release`
4. **Description:**

```markdown
## 🥒 Pickle Rick Multi-CLI - Initial Release

*BURP* The ultimate autonomous coding agent is now available across **5 AI CLI platforms**!

### What's New

✅ Support for **Claude Code** (full God Mode with hooks)
✅ Support for **Qwen Code** (Gemini clone by Alibaba)
✅ Support for **Mistral Vibe** (skill-based)
✅ Support for **Codex** (OpenAI ChatGPT CLI)
✅ Support for **Kimi Code** (manual workaround)
✅ Universal installer with auto-detection
✅ Bug fixes: Qwen mode detection, `/eat-pickle` persona exit

### Installation

```bash
git clone https://github.com/averystormknight-hue/pickle-rick-multi-cli.git
cd pickle-rick-multi-cli
bash install.sh
```

### Quick Start

**Claude Code:**
```bash
claude
/pickle "Add authentication to my API"
```

**Qwen Code:**
```bash
qwen
/pickle "Refactor the user service"
```

### Features

🥒 **7-Phase Engineering Lifecycle**
- PRD → Breakdown → Research → Plan → Implement → Refactor → Verify

🥒 **Rick Sanchez Personality**
- Arrogant genius with brutal honesty
- *Burps* constantly but delivers perfection

🥒 **Production-Quality Code**
- Comprehensive tests
- Security-conscious
- Zero "AI slop"

### Credits

**Original:** [Gal Zahavi](https://github.com/galz10/pickle-rick-extension) (Gemini CLI)
**Multi-CLI Port:** Avery Knight

### License

Apache 2.0

---

*I'm Pickle Riiiiick!* 🥒💚

*Wubba lubba dub dub!*
```

5. Click "Publish release"

## Step 5: Update README (After Push)

After pushing, update the README on GitHub to fix the URLs:

Replace `averystormknight-hue` with your actual username in:
- Installation instructions
- Issue links
- Any other references

## Optional Enhancements

### Add Badges

Add these to the top of your README.md:

```markdown
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Version](https://img.shields.io/badge/version-2.0.0-green.svg)](https://github.com/averystormknight-hue/pickle-rick-multi-cli/releases)
[![Platforms](https://img.shields.io/badge/platforms-5-orange.svg)](https://github.com/averystormknight-hue/pickle-rick-multi-cli)
```

### Set Up GitHub Pages (Documentation Site)

1. Go to Settings → Pages
2. Source: Deploy from branch
3. Branch: `main` → `/docs` (if you create a docs folder)
4. Save

### Add Social Preview Image

1. Create a cool Rick Sanchez pickle image (1200x630px)
2. Settings → General → Social preview → Upload image

## Useful Git Commands

```bash
# Check status
git status

# View commit history
git log --oneline

# View remote
git remote -v

# Create new branch
git checkout -b feature/new-feature

# Push new branch
git push -u origin feature/new-feature
```

## Current Repository Stats

```
📁 Directory: ~/Dev/pickle-rick-multi-cli
🌿 Branch: main
💾 Commit: a430de7 (Initial release: Pickle Rick Multi-CLI v2.0.0)
📝 Files: 79
📊 Lines: 11,291 insertions
👥 Authors: Avery Knight, Claude Sonnet 4.5
```

---

## Ready to Push?

```bash
cd ~/Dev/pickle-rick-multi-cli
git remote add origin https://github.com/averystormknight-hue/pickle-rick-multi-cli.git
git push -u origin main
```

**Then share the link with the world!** 🚀

*BURP* Now go make this public, Morty!

*Wubba lubba dub dub!* 🥒💚
