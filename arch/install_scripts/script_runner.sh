#!/bin/bash

# --- Desktop Environment Setup ---
paru -S --noconfirm --needed hypridle hyprpaper hyprland hyprlock swaync fuzzel waybar ly

rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
rm -rf ~/.config/nvim
rm -rf ~/.config/waybar

mv ../.config/* ~/.config/
mv ../.hypr ~/

sudo systemctl enable ly

# --- ZSH Setup ---
sudo pacman -S --noconfirm --needed zsh
cp -rf ../zsh/* ~/
chsh -s "$(which zsh)"

# --- TLP Setup ---
sudo pacman -S --noconfirm --needed tlp
sudo systemctl enable --now tlp

sudo sed -i '/^START_CHARGE_THRESH_BAT0=/d' /etc/tlp.conf
sudo sed -i '/^STOP_CHARGE_THRESH_BAT0=/d' /etc/tlp.conf

echo "START_CHARGE_THRESH_BAT0=75" | sudo tee -a /etc/tlp.conf
echo "STOP_CHARGE_THRESH_BAT0=80"  | sudo tee -a /etc/tlp.conf

sudo tlp start

# --- Fonts ---
sudo pacman -S --noconfirm --needed noto-fonts noto-fonts-cjk noto-fonts-emoji

# --- Rust Development ---
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# --- Web Development ---
paru -S --noconfirm --needed nodejs npm mongodb-bin

# --- Python Development ---
sudo pacman -S --noconfirm --needed python python-pip python-virtualenv

# --- Java Development ---
sudo pacman -S --noconfirm --needed jdk-openjdk

# --- C/C++ Development ---
sudo pacman -S --noconfirm --needed gcc clang cmake gdb make

# --- Code Editors ---
paru -S --noconfirm --needed visual-studio-code-bin neovim emacs-wayland zsh
