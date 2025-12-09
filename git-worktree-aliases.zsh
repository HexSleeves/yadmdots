# Git Worktree Aliases for ZSH
# Add these to your ~/.zshrc file

# Basic worktree operations
alias gwl='git worktree list'
alias gwa='git worktree add'
alias gwr='git worktree remove'
alias gwp='git worktree prune'

# Advanced worktree operations
alias gwaf='git worktree add --force'    # Force add (overwrite existing)
alias gwab='git worktree add -b'         # Add with new branch
alias gwac='git worktree add --checkout' # Add and checkout
alias gwad='git worktree add --detach'   # Add in detached HEAD state

# Worktree navigation helpers
alias gwcd='cd $(git worktree list | fzf | cut -d" " -f1)'  # Requires fzf
alias gwls='git worktree list --porcelain | grep "worktree" | cut -d" " -f2'

# Worktree cleanup
alias gwclean='git worktree prune && git branch -vv | grep ": gone]" | awk "{print \$1}" | xargs git branch -d'

# Quick worktree creation for common patterns
alias gwfeat='_gw_feature'
alias gwfix='_gw_hotfix'
alias gwrel='_gw_release'

# Helper functions
_gw_feature() {
    if [ -z "$1" ]; then
        echo "Usage: gwfeat <feature-name>"
        return 1
    fi
    git worktree add -b "feature/$1" "../feature-$1" origin/main
}

_gw_hotfix() {
    if [ -z "$1" ]; then
        echo "Usage: gwfix <hotfix-name>"
        return 1
    fi
    git worktree add -b "hotfix/$1" "../hotfix-$1" origin/main
}

_gw_release() {
    if [ -z "$1" ]; then
        echo "Usage: gwrel <version>"
        return 1
    fi
    git worktree add -b "release/$1" "../release-$1" origin/develop
}

# Worktree status overview
alias gwstatus='git worktree list | while read line; do echo "=== $line ==="; cd $(echo $line | cut -d" " -f1); git status -s; echo; done'
