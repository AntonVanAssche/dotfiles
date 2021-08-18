#!/bin/bash

# This script will install all the packages I use on day-to-day use.


message info "Installing wget & curl..."
sudo pacman -Sy wget curl -y --noconfirm

message info "Installing AUR..."
sudo pacman -Syu --noconfirm
sudo pacman -Sy base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $HOME

message info "Installing Termite & tools..."
sudo pacman -Sy vim htop openresolv mpv wireguard-tools lsd nnn --noconfirm
yay -Sy termite --noconfirm
vim +PluginInstall +qall

message info "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

message info "Installing Nerdfonts (This can take a while)..."
mkdir fonts && cd fonts
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest | egrep -o "/ryanoasis/nerd-fonts/releases/download/.+\.zip" | sed 's/^/https:\/\/github.com/' | wget -i/dev/fd/0
unzip "*.zip" -d ~/.local/share/fonts
fc-cache -fv
cd .. && rm -rf fonts

message info "Installing vscode..."
sudo pacman -Sy code --noconfirm

message info "Installing Transmission & Transgui..."
sudo pacman -Sy transmission-cli transmission--noconfirmtk --noconfirm
yay -Sy transgui --noconfirm

message info "Installing Java..."
sudo pacman -Sy jre-openjdk --noconfirm

message info "Installing Spotify..."
yay -Sy spotify --noconfirm

message info "installing spicetify..."
yay -Sy spicetify-cli --noconfirm
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

message info "To apply the spicetify theme Log in to spotify using the client. After that run these commands: \nspicetify backup \nspicetify config extensions dribbblish.js \nspicetify config current_theme Dribbblish color_scheme base \nspicetify config inject_css 1 replace_colors 1 overwrite_assets 1 \nspicetify apply \nspicetify config color_scheme dribbblish \nspicetify apply "

message info "Installing Google Chrome..."
yay -Sy google-chrome --noconfirm

message info "Installing Discord..."
yay -Sy discord --noconfirm

message info "Installing Virtualbox..."
sudo pacman -Sy virtualbox --noconfirm

message info "Installing Vagrant "
sudo pacman -Sy vagrant --noconfirm
