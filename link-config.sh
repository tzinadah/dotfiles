#!/bin/sh

# Make directories
mkdir -p ~/.config/tmux/ ~/.config/Code/User/ ~/.config/posh/

# Systems links
ln -sfnT ~/dotfiles/nvim/ ~/.config/nvim/
ln -sfnT ~/dotfiles/ghostty/ ~/.config/ghostty/
ln -sf ~/dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -sf ~/dotfiles/posh/config.toml ~/.config/posh/config.toml
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/update.sh ~/update.sh
ln -sf ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -sf ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
