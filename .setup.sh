#!/bin/bash

# Check if Homebrew is installed, if not, install it
if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# Install packages available through Homebrew
brew_packages=(
    "git-delta"
    "fzf"
    "tmux"
    "ripgrep"
    "bat"
    "fd"
    "tree"
    "jq"
    "reattach-to-user-namespace",
    "lazygit",
    "lazydocker"
)

for package in "${brew_packages[@]}"; do
    brew install $package
done

# Install git-fuzzy (not available through Homebrew)
git clone https://github.com/bigH/git-fuzzy.git ~/.git-fuzzy

# Install TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10k theme for Oh My Zsh
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

echo "Installation completed."

dotfiles_dir="$HOME/.dotfiles"

# Create symlinks
ln -sf $dotfiles_dir/.zshrc $HOME/.zshrc
ln -sf $dotfiles_dir/.tmux.conf $HOME/.tmux.conf
ln -sf $dotfiles_dir/.gitconfig $HOME/.gitconfig
ln -sf $dotfiles_dir/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -sf $dotfiles_dir/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -sf $dotfiles_dir/vscode/settings.json $HOME/Library/Application\ Support/Cursor/User/settings.json
ln -sf $dotfiles_dir/vscode/keybindings.json $HOME/Library/Application\ Support/Cursor/User/keybindings.json

echo "Environment setup completed."
