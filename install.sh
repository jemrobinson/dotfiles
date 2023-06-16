#! /usr/bin/env sh

HOME_DIRECTORY="${HOME}"

# Install Homebrew
if ! (type brew > /dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
export PATH=/opt/homebrew/bin:$PATH

# Install homebrew packages
echo "🍺 Installing stow with Homebrew"
brew install stow 2> /dev/null

# Install oh-my-zsh
echo "🐚 Installing oh-my-zsh"
oh-my-zsh/install.sh

# Install dotfiles with stow
echo "⚫ Installing dotfiles with stow"
for category in $(ls dotfiles); do
    echo "  ⌛ Working on $category"
    stow -d dotfiles -t "$HOME_DIRECTORY" -R "$category"
done

# Install executables with stow
echo "❗ Installing executables with stow"
mkdir -p "${HOME_DIRECTORY}/.local/bin"
stow -t "${HOME_DIRECTORY}/.local/bin" -R executables
for executable in $(ls "${HOME_DIRECTORY}/.local/bin"); do echo "  ✅ Installed $executable"; done

# Install homebrew packages
echo "🍺 Installing Homebrew packages"
homebrew/install.sh

