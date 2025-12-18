#!/bin/bash
# install.sh - Sets up Claude Code configuration from stevenmays/dotfiles
#
# Usage:
#   curl -sL https://raw.githubusercontent.com/stevenmays/dotfiles/master/ai/claude/install.sh | bash
#
# What this does:
#   1. Downloads skills, commands, and hooks to ~/.claude/
#   2. Creates settings.json with recommended defaults (if not exists)
#   3. Outputs plugin install commands to run inside Claude Code

set -e

REPO="https://github.com/stevenmays/dotfiles"
CLAUDE_DIR="$HOME/.claude"
TMP_DIR=$(mktemp -d)

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo "Setting up Claude Code configuration..."
echo ""

# Clone dotfiles (sparse checkout for just ai/claude)
echo "Downloading configuration from $REPO..."
git clone --depth 1 --filter=blob:none --sparse "$REPO" "$TMP_DIR" 2>/dev/null
cd "$TMP_DIR"
git sparse-checkout set ai/claude 2>/dev/null

# Create directories
mkdir -p "$CLAUDE_DIR"/{skills,commands,hooks}

# Copy skills (each skill is a directory with SKILL.md)
if [ -d "ai/claude/skills" ]; then
  echo "Installing skills..."
  cp -r ai/claude/skills/* "$CLAUDE_DIR/skills/" 2>/dev/null || true
fi

# Copy commands
if [ -d "ai/claude/commands" ]; then
  echo "Installing commands..."
  cp -r ai/claude/commands/* "$CLAUDE_DIR/commands/" 2>/dev/null || true
fi

# Copy hooks
if [ -d "ai/claude/hooks" ]; then
  echo "Installing hooks..."
  cp -r ai/claude/hooks/* "$CLAUDE_DIR/hooks/" 2>/dev/null || true
fi

# Handle settings.json
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "settings.json exists - preserving your current settings"
  echo "  (see recommended settings below)"
else
  echo "Creating settings.json..."
  cat > "$CLAUDE_DIR/settings.json" << 'EOF'
{
  "includeCoAuthoredBy": false,
  "alwaysThinkingEnabled": true,
  "env": {
    "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "64000",
    "MAX_THINKING_TOKENS": "31999"
  }
}
EOF
fi

echo ""
echo "File installation complete!"
echo ""
echo "Installed to $CLAUDE_DIR:"
ls -la "$CLAUDE_DIR" 2>/dev/null | grep -E "^d|settings" | head -10
echo ""

# Plugin installation commands
cat << 'EOF'
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NEXT STEP: Install plugins inside Claude Code

Plugins must be installed from within Claude Code (not the shell).
Open Claude Code and paste the following commands:

# Add plugin marketplaces
/plugin marketplace add anthropics/claude-code
/plugin marketplace add ast-grep/claude-skill
/plugin marketplace add sawyerhood/dev-browser

# Install official plugins
/plugin install hookify@claude-code-plugins
/plugin install pr-review-toolkit@claude-code-plugins
/plugin install commit-commands@claude-code-plugins
/plugin install feature-dev@claude-code-plugins
/plugin install frontend-design@claude-code-plugins

# Install third-party plugins
/plugin install ast-grep
/plugin install dev-browser

Note: ast-grep plugin requires the CLI tool:
  brew install ast-grep

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

echo ""
echo "For project setup, copy CLAUDE.md to your project root:"
echo "  curl -sO https://raw.githubusercontent.com/stevenmays/dotfiles/master/ai/claude/CLAUDE.md"
echo ""
