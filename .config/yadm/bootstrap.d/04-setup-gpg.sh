#!/bin/sh

# Setup GPG Keys
# Idempotent script to setup GPG

echo "🔐 Setting up GPG keys..."

# Ensure GPG is installed
if ! command -v gpg >/dev/null 2>&1; then
    echo "Installing GPG..."
    if command -v brew >/dev/null 2>&1; then
        brew install gnupg
    else
        echo "❌ Homebrew not found. Cannot install GPG."
        exit 1
    fi
fi

# Ensure directories exist
mkdir -p ~/.local/share/gnupg/.exported-keyring

# Decrypt secrets if available
if [[ -f "${HOME}/.local/share/gnupg/.exported-keyring/secret.asc.enc" ]] || [[ -f "${HOME}/.config/yadm/encrypt" ]]; then
    echo "🔓 Decrypting secrets..."
    if yadm decrypt; then
        echo "✅ Secrets decrypted"
    else
        echo "⚠️  Decryption failed (keys might be missing or already decrypted)"
    fi
fi

# Import keys if they exist
if ls "$HOME/.local/share/gnupg/.exported-keyring"/*.asc >/dev/null 2>&1; then
    echo "Importing keys..."
    gpg --import "$HOME/.local/share/gnupg/.exported-keyring"/*.asc 2>/dev/null || true
    
    if [[ -f "$HOME/.local/share/gnupg/.exported-keyring/ownertrust.txt" ]]; then
        gpg --import-ownertrust "$HOME/.local/share/gnupg/.exported-keyring/ownertrust.txt" 2>/dev/null || true
    fi
    echo "✅ GPG keys imported"
else
    echo "ℹ️  No exported keys found to import."
fi