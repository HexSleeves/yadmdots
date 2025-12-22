#!/usr/bin/env bash

# Mise Development Tools Installation Script
# Installs and configures development tools via mise (version manager)

set -euo pipefail

# Check if mise is available
if ! command -v mise >/dev/null 2>&1; then
    echo "❌ mise not found. Please install mise first."
    exit 1
fi

class=$(yadm config local.class || echo "Personal")
echo "🔧 Configuring mise tools for '${class}' profile..."

# Navigate to home directory for global installations
cd "${HOME}"

# Function to install mise tool safely
install_mise_tool() {
    local tool="$1"
    local version="$2"

    echo "Installing ${tool}@${version}..."
    if mise use --global "${tool}@${version}" 2>/dev/null; then
        echo "✅ Installed ${tool}@${version}"
        return 0
    else
        echo "⚠️  Failed to install ${tool}@${version}"
        return 1
    fi
}

# --- Core Tools (All Profiles) ---
echo "📋 Installing core development tools..."
install_mise_tool "node" "lts"
install_mise_tool "python" "latest"
install_mise_tool "golang" "latest"
install_mise_tool "deno" "latest"
install_mise_tool "bun" "latest"

# --- Personal Profile Extras ---
if [[ "$class" == "Personal" ]]; then
    echo "🚀 Installing Personal profile extras..."

    if ! command -v rustc >/dev/null 2>&1; then
        install_mise_tool "rust" "latest"
    else
        echo "✅ Rust already installed (skipping mise install)"
    fi
    install_mise_tool "lua" "latest"

    # Cargo Tools (via mise if possible, or cargo directly)
    if command -v cargo >/dev/null 2>&1; then
        echo "🦀 Installing Cargo tools..."
        # List of tools to install via cargo
        cargo_tools=("bat" "ripgrep" "fd-find" "eza" "zoxide" "starship" "bottom" "tokei")

        # Check if cargo-binstall is available (it should be from core install or manual)
        if ! command -v cargo-binstall >/dev/null 2>&1; then
             echo "📦 Installing cargo-binstall..."
             cargo install cargo-binstall 2>/dev/null || true
        fi

        for tool in "${cargo_tools[@]}"; do
            if command -v cargo-binstall >/dev/null 2>&1; then
                cargo binstall --no-confirm --quiet "$tool" 2>/dev/null || echo "⚠️  Failed to install $tool"
            else
                cargo install --quiet "$tool" 2>/dev/null || echo "⚠️  Failed to install $tool"
            fi
        done
    fi

    # NPM Global Tools
    if command -v npm >/dev/null 2>&1; then
        echo "📦 Installing global NPM tools..."
        npm install -g typescript ts-node neovim || true
    fi
fi

# Update all
echo "🔄 Updating mise plugins..."
mise upgrade --yes

echo "🎉 Mise setup complete!"
