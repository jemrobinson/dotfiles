#! /bin/sh
# Ignore duplicates in history
export HISTCONTROL=ignoredups

# Add homebrew sbin and local bin to path
export PATH="${PATH}:${HOME}/.local/bin:/usr/local/sbin"

# ## Add OpenSSL compilation flags
# OPENSSL_PREFIX="/usr/local/opt/openssl@1.1"
# export CFLAGS="${CFLAGS} -I${OPENSSL_PREFIX}/include"
# export CPPFLAGS="${CPPFLAGS} -I${OPENSSL_PREFIX}/include"
# export LDFLAGS="${LDFLAGS} -L${OPENSSL_PREFIX}/lib"
# export LIBRARY_PATH="$LIBRARY_PATH:${OPENSSL_PREFIX}/lib/"

# # Set homebrew ruby as default
# RUBY_PREFIX="/usr/local/opt/ruby"
# GEM_DIR=$(find "/usr/local/lib/ruby/gems" -maxdepth 1 -type d | sort -n | tail -n 1)
# export PATH="${RUBY_PREFIX}/bin:${GEM_DIR}/bin:${PATH}"
# export CFLAGS="${CFLAGS} -I${RUBY_PREFIX}/include"
# export CPPFLAGS="${CPPFLAGS} -I${RUBY_PREFIX}/include"
# export LDFLAGS="${LDFLAGS} -L${RUBY_PREFIX}/lib"
# export LIBRARY_PATH="$LIBRARY_PATH:${RUBY_PREFIX}/lib/"

# # Prepend pyenv executable and to PATH following instructions from https://github.com/pyenv/pyenv
# # Note this is equivalent to `eval "$(pyenv init --path)"` but faster
# export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
# export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:$PATH"

# # Set global go path
# export GOPATH="${HOME}/.go"
# export PATH="${PATH}:${GOPATH}:${GOPATH}/bin"
# mkdir -p "$GOPATH"

# # Add dotnet paths
# export PATH="${PATH}:${HOME}/.dotnet/tools"

# For git: automatically exit pager if there is only one page of output
export LESS="FRX"

# Aliases
# ... colourised ls
alias ls='ls -G'
# ... SSH that does not store details in the hosts file
alias goldfissh='ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no"'
