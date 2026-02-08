#!/bin/bash
# Pickle Rick Universal Installer
# Installs Pickle Rick across all supported AI CLIs

set -e

# *BURP* Let's install me everywhere, Morty

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🥒 PICKLE RICK UNIVERSAL INSTALLER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "*BURP* Installing Pickle Rick across all your AI CLIs..."
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Detection functions
detect_cli() {
    local cli_name="$1"
    local cli_command="$2"

    if command -v "$cli_command" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $cli_name detected"
        return 0
    else
        echo -e "${YELLOW}⊗${NC} $cli_name not found (skipping)"
        return 1
    fi
}

# Installation functions

install_claude() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Installing for Claude Code..."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    # Already installed at ~/.claude/extensions/pickle-rick/
    if [ -d ~/.claude/extensions/pickle-rick ]; then
        echo -e "${GREEN}✓${NC} Claude Code version already installed"
        echo "   Location: ~/.claude/extensions/pickle-rick/"
        echo "   Commands: /pickle, /pickle-prd, /add-to-pickle-jar, etc."
    else
        echo -e "${RED}✗${NC} Claude Code installation not found"
        echo "   Run this script from the directory containing the Claude version"
    fi
}

install_qwen() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Installing for Qwen Code..."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    if [ -d ~/.qwen/extensions/pickle-rick ]; then
        echo -e "${GREEN}✓${NC} Qwen Code version already installed"
        echo "   Location: ~/.qwen/extensions/pickle-rick/"

        # Link the extension
        echo "   Linking extension..."
        qwen extensions link ~/.qwen/extensions/pickle-rick 2>/dev/null || true

        echo -e "${GREEN}✓${NC} Qwen installation complete"
        echo "   Commands: /pickle, /pickle-prd, /add-to-pickle-jar, etc."
    else
        echo -e "${RED}✗${NC} Qwen Code installation not found"
    fi
}

install_vibe() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Installing for Mistral Vibe..."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    if [ -d ~/.vibe/skills/pickle-rick ]; then
        echo -e "${GREEN}✓${NC} Vibe version already installed"
        echo "   Location: ~/.vibe/skills/pickle-rick/"

        # Update config.toml
        if [ -f ~/.vibe/config.toml ]; then
            # Check if skill_paths includes our directory
            if ! grep -q 'skill_paths.*vibe/skills' ~/.vibe/config.toml; then
                echo "   Adding to config.toml..."
                # Note: User should manually add to enabled_skills
                echo ""
                echo "   ${YELLOW}ACTION REQUIRED:${NC} Add to ~/.vibe/config.toml:"
                echo "   skill_paths = [\"~/.vibe/skills\"]"
                echo "   enabled_skills = [\"pickle-rick\"]"
            else
                echo -e "${GREEN}✓${NC} Config already set"
            fi
        fi

        echo -e "${GREEN}✓${NC} Vibe installation complete"
    else
        echo -e "${RED}✗${NC} Vibe installation not found"
    fi
}

install_codex() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Installing for Codex (OpenAI ChatGPT CLI)..."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    if [ -d ~/.codex/skills/pickle-rick ]; then
        echo -e "${GREEN}✓${NC} Codex version already installed"
        echo "   Location: ~/.codex/skills/pickle-rick/"
        echo "   Codex auto-discovers skills in ~/.codex/skills/"
        echo -e "${GREEN}✓${NC} Codex installation complete"
    else
        echo -e "${RED}✗${NC} Codex installation not found"
    fi
}

install_kimi() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Installing for Kimi Code..."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    if [ -d ~/.kimi/pickle-rick ]; then
        echo -e "${YELLOW}⚠${NC}  Kimi doesn't support extensions yet"
        echo "   Location: ~/.kimi/pickle-rick/ (manual workaround)"
        echo ""
        echo "   ${YELLOW}USAGE:${NC} Kimi requires manual prompt invocation:"
        echo "   kimi -p \"\$(cat ~/.kimi/pickle-rick/prompt.txt)"
        echo ""
        echo "   Your task here\""
        echo ""
        echo "   See ~/.kimi/pickle-rick/README.md for details"
    else
        echo -e "${RED}✗${NC} Kimi installation not found"
    fi
}

# Main installation

echo "Detecting installed AI CLIs..."
echo ""

INSTALLED_CLIS=()

if detect_cli "Claude Code" "claude"; then
    INSTALLED_CLIS+=("claude")
fi

if detect_cli "Qwen Code" "qwen"; then
    INSTALLED_CLIS+=("qwen")
fi

if detect_cli "Mistral Vibe" "vibe"; then
    INSTALLED_CLIS+=("vibe")
fi

if detect_cli "Codex (OpenAI)" "codex"; then
    INSTALLED_CLIS+=("codex")
fi

if detect_cli "Kimi Code" "kimi"; then
    INSTALLED_CLIS+=("kimi")
fi

if [ ${#INSTALLED_CLIS[@]} -eq 0 ]; then
    echo ""
    echo -e "${RED}✗${NC} No supported AI CLIs found!"
    echo ""
    echo "Supported CLIs:"
    echo "  - Claude Code (claude)"
    echo "  - Qwen Code (qwen)"
    echo "  - Mistral Vibe (vibe)"
    echo "  - Codex (codex)"
    echo "  - Kimi Code (kimi)"
    echo ""
    exit 1
fi

echo ""
echo "Found ${#INSTALLED_CLIS[@]} CLI(s). Installing Pickle Rick..."

# Install to each detected CLI
for cli in "${INSTALLED_CLIS[@]}"; do
    case $cli in
        claude) install_claude ;;
        qwen) install_qwen ;;
        vibe) install_vibe ;;
        codex) install_codex ;;
        kimi) install_kimi ;;
    esac
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🥒 INSTALLATION COMPLETE!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "*BURP* Pickle Rick is installed across all your CLIs, Morty!"
echo ""
echo "Usage by CLI:"
echo ""

if [[ " ${INSTALLED_CLIS[@]} " =~ " claude " ]]; then
    echo "  ${GREEN}Claude Code:${NC}"
    echo "    claude"
    echo "    /pickle \"Your task\""
    echo ""
fi

if [[ " ${INSTALLED_CLIS[@]} " =~ " qwen " ]]; then
    echo "  ${GREEN}Qwen Code:${NC}"
    echo "    qwen"
    echo "    /pickle \"Your task\""
    echo ""
fi

if [[ " ${INSTALLED_CLIS[@]} " =~ " vibe " ]]; then
    echo "  ${GREEN}Mistral Vibe:${NC}"
    echo "    vibe"
    echo "    [Invoke Pickle Rick skill]"
    echo ""
fi

if [[ " ${INSTALLED_CLIS[@]} " =~ " codex " ]]; then
    echo "  ${GREEN}Codex:${NC}"
    echo "    codex"
    echo "    [Invoke Pickle Rick skill]"
    echo ""
fi

if [[ " ${INSTALLED_CLIS[@]} " =~ " kimi " ]]; then
    echo "  ${YELLOW}Kimi Code (manual):${NC}"
    echo "    kimi -p \"\$(cat ~/.kimi/pickle-rick/prompt.txt)"
    echo "    Your task\""
    echo ""
fi

echo "Documentation:"
echo "  - Claude: ~/.claude/extensions/pickle-rick/README.md"
echo "  - Qwen: ~/.qwen/extensions/pickle-rick/README.md"
echo "  - Vibe: ~/.vibe/skills/pickle-rick/README.md"
echo "  - Codex: ~/.codex/skills/pickle-rick/README.md"
echo "  - Kimi: ~/.kimi/pickle-rick/README.md"
echo ""
echo "*I'm Pickle Riiiiick!* 🥒💚"
echo ""
echo "*Wubba lubba dub dub!*"
echo ""
