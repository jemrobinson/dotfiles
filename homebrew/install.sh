#! /usr/bin/env sh

script_directory=$(dirname "$(readlink -f "$0")")

# Update installed packages
echo "  ⌛ Updating installed packages..."
brew update
brew upgrade

# Construct Brewfile
rm "${script_directory}/Brewfile" 2> /dev/null
rm "${script_directory}/Brewfile.lock.json" 2> /dev/null
touch "${script_directory}/Brewfile"

# Add taps
echo "  ⌛ Adding homebrew taps to bundle..."
while IFS= read -r line; do
    echo "tap \"$line\"" >> "${script_directory}/Brewfile"
done < "${script_directory}/brew-taps.txt"

# Add formulae
echo "  ⌛ Adding homebrew formulae to bundle..."
while IFS= read -r line; do
    echo "brew \"$line\"" >> "${script_directory}/Brewfile"
done < "${script_directory}/brew-formulae.txt"

# Add casks
echo "  ⌛ Adding homebrew taps to bundle..."
while IFS= read -r line; do
    echo "cask \"$line\"" >> "${script_directory}/Brewfile"
done < "${script_directory}/brew-casks.txt"

# Install bundle with homebrew
echo "  ⌛ Applying bundle..."
brew bundle --file "${script_directory}/Brewfile" --force --cleanup

# Upgrade any casks with auto_updates enabled
echo "  ⌛ Upgrading casks..."
brew upgrade --cask --greedy

# Remove Microsoft Auto Update if it is installed
echo "  ⌛ Removing undesired packages..."
if [[ $(brew list --cask -1 | grep microsoft-auto-update) ]]; then
    brew remove --force microsoft-auto-update
fi

