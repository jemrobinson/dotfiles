#! /usr/bin/env zsh

# N.B. This file is loaded before .zshrc in login shells

# Add local bin and homebrew bin to path
export PATH="${PATH}:${HOME}/.local/bin:/opt/homebrew/bin"

# Ignore duplicates in history
export HISTCONTROL=ignoredups

# Aliases
# SSH that does not store details in the hosts file
alias goldfissh='ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no"'
