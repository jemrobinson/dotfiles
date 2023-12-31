#! /usr/bin/env sh

HOME_DIRECTORY="${HOME}"
SCRIPT_DIRECTORY=$(dirname "$(readlink -f "$0")")

# Install fonts
echo "🖨️ Installing fonts"
cp "${SCRIPT_DIRECTORY}"/fonts/*.ttf ~/Library/Fonts
find ~/Library/Fonts/*.ttf -exec echo '  ✅ Installed {}' \;

# Install Homebrew
if ! (type brew > /dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
export PATH="/opt/homebrew/bin:$PATH"

# Install homebrew packages
echo "🍺 Installing stow with Homebrew"
brew install stow 2> /dev/null

# Install oh-my-zsh
echo "🐚 Installing oh-my-zsh"
"${SCRIPT_DIRECTORY}"/oh-my-zsh/install.sh

# Install dotfiles with stow
echo "⚫ Installing dotfiles with stow"
find "${SCRIPT_DIRECTORY}/dotfiles" -type d -depth 1 -exec basename {} \; | while read -r category; do
    echo "  ⌛ Working on $category"
    stow -d "${SCRIPT_DIRECTORY}/dotfiles" -t "$HOME_DIRECTORY" -R "$category"
done

# Install executables with stow
echo "❗ Installing executables with stow"
mkdir -p "${HOME_DIRECTORY}/.local/bin"
stow -t "${HOME_DIRECTORY}/.local/bin" -d "${SCRIPT_DIRECTORY}" -R executables
find "${HOME_DIRECTORY}/.local/bin" -type f -depth 1 | while read -r executable; do
    echo "  ✅ Installed $executable"
done

# Install homebrew packages
echo "🍺 Installing Homebrew packages"
"${SCRIPT_DIRECTORY}"/homebrew/install.sh

# Fix application permissions
sudo chown -R $(whoami):admin /Applications 2> /dev/null

# Print messages
echo "In case of font problems in zsh, see here: https://gist.github.com/kevin-smets/8568070 and https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
echo ""
echo "Use the following colour-schemes in iTerm2"
echo "* zsh should use 'tango-dark-tweaked' (import from the iterm directory)"
echo "* Powershell should use 'shades-of-purple' (import from the iterm directory)"
echo ""
echo "To enable touchbar sudo, add 'auth sufficient pam_tid.so' to /etc/pam.d/sudo"

