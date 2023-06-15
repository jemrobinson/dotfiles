#! /usr/bin/env sh

script_directory=$(dirname "$(readlink -f "$0")")

# Construct Brewfile
rm "${script_directory}/Brewfile" 2> /dev/null
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

# Add casks
echo "  ⌛ Adding VSCode plugins to bundle..."
while IFS= read -r line; do
    echo "vscode \"$line\"" >> "${script_directory}/Brewfile"
done < "${script_directory}/vscode-plugins.txt"

# Install bundle with homebrew
echo "  ⌛ Applying bundle..."
brew bundle --file "${script_directory}/Brewfile" --force --cleanup
