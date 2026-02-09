# Changelog

All notable changes to Pickle Rick Multi-CLI will be documented in this file.

## [2.1.0] - 2026-02-09

### 🎉 MAJOR MILESTONE: All 5 CLIs Fully Operational!

**Breaking Discovery:** Kimi Code has full skill support (not manual workaround as originally thought)

### Added
- ✅ **Kimi Code full skill support** via `/skill:pickle-rick` command
- Proper Kimi skill structure with `skill.md` format
- Exit command support: `stop pickle-rick skill`
- All 5 CLIs now at 100% working status

### Changed
- **Kimi:** Replaced manual prompt injection workaround with proper skill system
- Updated installation paths from `~/.kimi/pickle-rick/` to `~/.kimi/skills/pickle-rick/`
- Updated main README activation methods section with all 5 CLIs
- Updated platform support table: All platforms now show ✅ status
- Updated `install.sh` with proper Kimi skill installation

### Removed
- Kimi manual workaround (`prompt.txt` injection method)
- "Limited support" warnings for Kimi

### Platform Status
- **Claude Code:** ✅ Full God Mode (slash commands, hooks, sessions)
- **Qwen Code:** ✅ Full Port (slash commands)
- **Codex (OpenAI):** ✅ Skill-based (menu selection)
- **Mistral Vibe:** ✅ Auto-activation (config-based)
- **Kimi Code:** ✅ Skill-based (slash command) **NEW!**

---

## [2.0.1] - 2026-02-08

### Fixed
- **Codex:** Fixed YAML frontmatter requirement
- **Codex:** Fixed personality activation (changed from docs to instructions format)
- **Vibe:** Fixed auto-activation documentation (clarified no slash commands needed)
- **Vibe:** Added config.toml setup instructions
- **Qwen:** Fixed mode detection bug in `pickle.toml`
- **Qwen:** Fixed `/eat-pickle` persona persistence bug

### Changed
- Rewrote Codex `SKILL.md` in proper "Instructions" format
- Rewrote Vibe `instructions.md` in command format
- Updated all READMEs with correct activation methods per CLI
- Added exit instructions for all platforms

---

## [2.0.0] - 2026-02-07

### Added
- 🎉 **Initial multi-CLI release!**
- Claude Code implementation (full God Mode)
- Qwen Code implementation (Gemini clone port)
- Mistral Vibe implementation (skill-based)
- Codex implementation (OpenAI ChatGPT CLI)
- Kimi Code implementation (manual workaround)
- Universal installer script with auto-detection
- Comprehensive documentation for all platforms
- Apache 2.0 license
- CONTRIBUTING.md guidelines

### Features
- 7-Phase Engineering Lifecycle (PRD → Breakdown → Research → Plan → Implement → Refactor → Verify)
- Rick Sanchez personality (burps, catchphrases, brutal honesty)
- Production-quality code standards
- Zero "AI slop" philosophy

### Credits
- Original by Gal Zahavi (Gemini)
- Multi-CLI port by Avery Knight
- Built with Claude Sonnet 4.5

---

## Release Definitions

- **Major (X.0.0):** New CLI platform support, breaking changes
- **Minor (x.X.0):** New features, significant improvements
- **Patch (x.x.X):** Bug fixes, documentation updates

---

*BURP* Version history complete! *Wubba lubba dub dub!* 🥒💚
