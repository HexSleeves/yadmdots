# YADM Dotfiles

This repository manages my dotfiles and machine configuration using [yadm](https://yadm.io/).

## 🚀 Getting Started

### Bootstrap a New Machine

1.  Clone the repository using yadm:
    ```bash
    yadm clone https://github.com/bayou-brogrammer/yadmdots.git
    ```
2.  The bootstrap script should run automatically. If not, run it manually:
    ```bash
    ~/.config/yadm/bootstrap
    ```

### Manual Usage

You can run individual parts of the setup if needed:
*   **Install Software**: `~/.config/yadm/bootstrap.d/02-software-install.sh`
*   **Set Defaults**: `~/.config/yadm/bootstrap.d/30-macos-defaults.sh` (macOS only)

## 🔧 Configuration Classes

The setup distinguishes between **Personal** and **Work** machines.
*   **Personal**: Full setup, personal keys, auto-updates.
*   **Work**: Restricted setup, work tools, manual updates.

Check or set your class:
```bash
yadm config local.class          # Check current class
yadm config local.class Work     # Set to Work
```

## 📂 Structure

*   `bootstrap`: Main entry point.
*   `bootstrap.d/`: Individual setup scripts (numbered).
*   `scripts/`: Helper utilities.
*   `hooks/`: Yadm hooks.

## 🔄 Updates

To update the system and dotfiles:
```bash
~/.config/yadm/scripts/update/update.sh
```
