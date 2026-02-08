# Contributing to Pickle Rick Multi-CLI

*BURP* So you want to contribute? Alright Morty, here's how not to screw it up.

## Ways to Contribute

1. **Add Support for New CLI Platforms**
   - Port Pickle Rick to other AI CLIs (DeepSeek, Perplexity, etc.)
   - Follow existing patterns in `claude-code/` or `qwen-code/`
   - Test thoroughly before submitting

2. **Bug Fixes**
   - Found a bug? Fix it and submit a PR
   - Include reproduction steps
   - Add tests if applicable

3. **Documentation**
   - Improve READMEs
   - Add usage examples
   - Fix typos (even geniuses make them)

4. **Features**
   - New skills/commands
   - Enhanced lifecycle phases
   - Better error handling

## Contribution Process

### 1. Fork & Clone

```bash
git clone https://github.com/YOUR_USERNAME/pickle-rick-multi-cli.git
cd pickle-rick-multi-cli
```

### 2. Create Feature Branch

```bash
git checkout -b feature/your-feature-name
```

### 3. Make Changes

- Follow existing code patterns
- Keep Rick's personality consistent
- Test on target CLI platforms

### 4. Test Your Changes

**For Claude Code:**
```bash
# Copy to test location
cp -r claude-code ~/.claude/extensions/pickle-rick-test
# Test in Claude
claude
/pickle "test task"
```

**For Qwen Code:**
```bash
cp -r qwen-code ~/.qwen/extensions/pickle-rick-test
qwen extensions link ~/.qwen/extensions/pickle-rick-test
qwen
/pickle "test task"
```

### 5. Commit

Use clear commit messages:
```bash
git add .
git commit -m "Add support for DeepSeek CLI"
```

### 6. Push & PR

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub.

## Code Standards

### Pickle Rick Personality

**DO:**
- Use burps: `*BURP*`, `*burp*`
- Call user "Morty"
- Use catchphrases: "Wubba lubba dub dub!", "I'm Pickle Rick!", "And that's the waaaaay the news goes!"
- Be arrogant but deliver perfection
- Mock everything while being helpful

**DON'T:**
- Break character
- Be actually rude or unhelpful
- Skip the engineering lifecycle

### Code Quality

**DO:**
- Write self-evident code (minimal comments)
- Follow existing patterns
- Test thoroughly
- Handle errors gracefully
- Document breaking changes

**DON'T:**
- Add obvious comments
- Create unnecessary abstractions
- Skip testing
- Break backward compatibility without warning

### CLI-Specific Guidelines

#### Claude Code / Qwen Code (Extensions)
- Use `.md` files for Claude, `.toml` for Qwen
- Include hooks in `hooks/` directory
- Scripts in `scripts/` directory
- Skills in `skills/` directory

#### Vibe / Codex (Skills)
- Use appropriate skill format per CLI
- Keep it simple (no complex hooks)
- Embed lifecycle in instructions

#### New CLI Platforms
- Study existing implementations
- Adapt to target CLI's architecture
- Update `install.sh` to support new platform
- Add documentation to main README

## Testing Checklist

Before submitting PR:

- [ ] Code works on target CLI
- [ ] No errors in autonomous mode
- [ ] `/eat-pickle` properly exits persona
- [ ] Session management works (if applicable)
- [ ] All 7 phases execute correctly
- [ ] Documentation updated
- [ ] No breaking changes to existing CLIs
- [ ] `install.sh` handles new platform (if adding CLI)

## Adding a New CLI Platform

1. **Create directory:** `new-cli-name/`

2. **Port core files:**
   - Main command/skill file
   - README with platform-specific instructions
   - Configuration files per CLI format

3. **Update installer:** Add detection and installation logic to `install.sh`

4. **Test installation:**
   ```bash
   bash install.sh
   # Verify your CLI is detected and installed correctly
   ```

5. **Update main README:** Add platform to supported CLIs table

## Questions?

- Open an issue
- Check existing implementations for examples
- Read the original Gemini source: https://github.com/galz10/pickle-rick-extension

## License

By contributing, you agree to license your contributions under Apache 2.0 (same as the project).

---

*BURP* Now stop reading and start coding, Morty!

*Wubba lubba dub dub!* 🥒💚
