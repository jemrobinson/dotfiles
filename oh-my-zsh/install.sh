#! /usr/bin/env sh

# Install Oh-My-Zsh
OHMYZSH_DIR="${HOME}/.oh-my-zsh"
if [ -e "$OHMYZSH_DIR" ]; then
    echo "  ⌛ Updating Oh-My-Zsh..."
    "${OHMYZSH_DIR}/tools/upgrade.sh"
else
    echo "  ⌛ Installing Oh-My-Zsh..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install pyenv-lazy
PYENVLAZY_DIR="${OHMYZSH_DIR}/custom/plugins/pyenv-lazy"
if [ -e "$PYENVLAZY_DIR" ]; then
    echo "  ⌛ Updating pyenv-lazy..."
    cd "$PYENVLAZY_DIR" || exit 1
    git pull
else
    echo "  ⌛ Installing pyenv-lazy..."
    git clone https://github.com/davidparsson/zsh-pyenv-lazy.git "$PYENVLAZY_DIR"
fi

# Install Powerlevel 10k
POWERLEVEL10K_DIR="${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"
if [ -e "$POWERLEVEL10K_DIR" ]; then
    echo "⌛ Updating Powerlevel 10k..."
    cd "$POWERLEVEL10K_DIR" || exit 1
    git pull
else
    echo "⌛ Installing Powerlevel 10k..."
    git clone https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL10K_DIR"
fi

