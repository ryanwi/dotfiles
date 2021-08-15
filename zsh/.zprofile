# .zprofile is sourced on login shells and before .zshrc. As a general rule, it should not change the
# shell environment at all.

# Homebrew exists at /opt/homebrew for arm64 macos
eval "$(/opt/homebrew/bin/brew shellenv)"
