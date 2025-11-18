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
    "ripgrep"
    "bat"
    "fd"
    "tree"
    "jq"
    "lazygit",
    "lazydocker"
)

for package in "${brew_packages[@]}"; do
    brew install $package
done

# MacPorts alternative (commented out):
# # Check if MacPorts is installed, if not, install it manually
# if ! command -v port &> /dev/null
# then
#     echo "MacPorts not found. Please install MacPorts manually from https://www.macports.org/install.php"
#     exit 1
# fi
#
# # Update MacPorts
# sudo port -v selfupdate
#
# # Install packages available through MacPorts
# macports_packages=(
#     "git-delta"
#     "fzf"
#     "ripgrep"
#     "bat"
#     "fd"
#     "tree"
#     "jq"
#     "lazygit"
#     "lazydocker"
# )
#
# for package in "${macports_packages[@]}"; do
#     sudo port install $package
# done

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
ln -sf $dotfiles_dir/.gitconfig $HOME/.gitconfig
ln -sf $dotfiles_dir/config $HOME/.config/ghostty/config
ln -sf $dotfiles_dir/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -sf $dotfiles_dir/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json

echo "Environment setup completed."
