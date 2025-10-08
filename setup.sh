#!/usr/bin/bash

# Script that will put these dotfiles to use. Assumes Fedora Linux (v. 42).
# 2025-10-08

# Assume this script to be ran from the dotfiles repo.  
# TODO: Should probably make a more robust solution... But YAGNI and whatnot.
dotfiles_path=$(pwd)

# Use DNF setup by symlink
cd /etc/dnf
sudo mv dnf.conf dnf.conf.bak
sudo ln -s $dotfiles_path/dnf/dnf.conf dnf.conf

# Same for nvim config...
cd ~/.config
# Remove whatever default config might exist
[ -d nvim ] && mv nvim nvim-bak
ln -s $dotfiles_path/nvim nvim

# And finally zshrc
# TODO: Should include setup for oh-my-zsh?
cd ~
[ -f .zshrc ] && mv .zshrc .zshrc-bak
ln -s $dotfiles_path/zsh/zshrc .zshrc

