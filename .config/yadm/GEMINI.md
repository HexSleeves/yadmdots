# YADM Dotfiles Bootstrap

This repository contains the configuration and scripts for bootstrapping and managing the user's development environment using [yadm](https://yadm.io/). It is designed to be cross-platform (macOS/Linux) and context-aware (Work/Personal).

## Project Overview

The core purpose of this project is to:
1.  **Bootstrap**: Automate the setup of a new machine from scratch.
2.  **Standardize**: Ensure a consistent environment across different machines.
3.  **Manage**: Handle dotfiles and configuration updates.

## Directory Structure

*   **`bootstrap`**: The master script that orchestrates the entire setup process. It executes scripts found in `bootstrap.d/` in alphanumeric order.
*   **`bootstrap.d/`**: Contains the individual setup steps.
    *   Naming convention: `NN-description.sh` (e.g., `00-ensure-machine-class.sh`, `02-software-install.sh`).
    *   Files with `##` suffixes are **yadm alternates**. Yadm automatically resolves these to the base filename based on the OS or configuration class (e.g., `script.sh##os.Darwin` becomes `script.sh` on macOS).
*   **`scripts/`**: Helper scripts and utilities used by the bootstrap process or for ongoing maintenance.
    *   `common/`: Shared libraries (colors, data, paths).
    *   `update/`: Scripts for updating the system and tools.
*   **`hooks/`**: Yadm hooks (e.g., `post_alt`, `post_reset`) that trigger actions after yadm operations.
*   **`logs/`**: Stores logs from the bootstrap execution.

## Bootstrapping Process

To initiate the bootstrap process manually (if not triggered automatically by yadm clone):

```bash
./bootstrap
```

### How it works:
1.  **Environment Setup**: Sources common variables and logging functions from `scripts/common/all.sh`.
2.  **Machine Class**: `00-ensure-machine-class.sh` checks for `yadm config local.class`. If not set, it prompts the user to select "Personal" or "Work".
3.  **Execution**: Iterates through executable scripts in `bootstrap.d/`.
    *   **Alternates**: Only executes resolved files (ignoring files still named `*##*`).
    *   **Interactive Checks**: Detects interactive scripts and runs them with user visibility; runs others silently with logging.
    *   **Error Handling**: allows retrying, skipping, or aborting on script failure.
4.  **Logging**: Detailed logs are written to `logs/bootstrap-YYYYMMDD-HHMMSS.log`.

## Configuration Classes

The setup adapts based on the `local.class` configuration:

*   **Personal**: Full installation, personal dotfiles, auto-updates.
*   **Work**: Compliant installation, work-specific tools, manual updates.

To check or set the class manually:
```bash
yadm config local.class
yadm config local.class Work  # or Personal
```

## Development & Contribution

*   **Adding a Step**: Create a new script in `bootstrap.d/` with the next available number prefix.
    *   Example: `50-new-setup-step.sh`.
    *   Ensure it is executable: `chmod +x bootstrap.d/50-new-setup-step.sh`.
*   **OS/Class Specifics**: Use yadm alternates syntax.
    *   `myscript.sh##os.Darwin` (macOS only)
    *   `myscript.sh##class.Work` (Work profile only)
    *   `myscript.sh##os.Linux,class.Personal` (Linux Personal only)
*   **Testing**: You can run individual scripts from `bootstrap.d/` or the main `./bootstrap` script to test the flow. Always check `logs/` for details.
