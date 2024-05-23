#! /usr/bin/env zsh

# .zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout

# Do PATH changes here: https://apple.stackexchange.com/questions/432226/homebrew-path-set-in-zshenv-is-overridden
# Add local bin and homebrew (s)bin to path
export PATH="${HOME}/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:${PATH}"

# Ignore duplicates in history
export HISTCONTROL=ignoredups

# Aliases
# SSH that does not store details in the hosts file
alias goldfissh='ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no"'
