#! /usr/bin/env sh


# Install Homebrew
if ! (type brew > /dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install homebrew packages
echo "🍺 Installing Homebrew packages"
homebrew/install.sh

# Install dotfiles with stow
echo "⚫ Installing dotfiles with stow"
stow -d dotfiles -t .. -v -R $(ls dotfiles)
