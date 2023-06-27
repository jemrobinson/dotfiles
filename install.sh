#! /usr/bin/env sh

HOME_DIRECTORY="${HOME}"

# Install fonts
echo "🖨️ Installing fonts"
cp fonts/*.ttf ~/Library/Fonts
find ~/Library/Fonts/*.ttf -exec echo '  ✅ Installed {}' \;

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
find dotfiles -type d -depth 1 -exec basename {} \; | while read -r category; do
    echo "  ⌛ Working on $category"
    stow -d dotfiles -t "$HOME_DIRECTORY" -R "$category"
done

# Install executables with stow
echo "❗ Installing executables with stow"
mkdir -p "${HOME_DIRECTORY}/.local/bin"
stow -t "${HOME_DIRECTORY}/.local/bin" -R executables
find "${HOME_DIRECTORY}/.local/bin" -type f -depth 1 | while read -r executable; do
    echo "  ✅ Installed $executable"
done

# Install homebrew packages
echo "🍺 Installing Homebrew packages"
homebrew/install.sh

# Print messages
echo "In case of font problems in zsh, see here: https://gist.github.com/kevin-smets/8568070 and https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
echo ""
echo "Use the following colour-schemes in iTerm2"
echo "* zsh should use 'tango-dark-tweaked' (import from the iterm directory)"
echo "* Powershell should use 'shades-of-purple' (import from the iterm directory)"
