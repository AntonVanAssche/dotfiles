#!/bin/bash

# This script will setup gnome.

# installing NECESSARY packages.
message info "Installing gnome-tweaks..."; sudo dnf install gnome-tweaks -y
message info "Installing Flat-remix theme..."; sudo dnf copr enable daniruiz/flat-remix -y && sudo dnf install gnome-shell-theme-flat-remix flat-remix-gnome -y
message info "Installing numix-icon-theme-circle..."; sudo dnf install numix-icon-theme-circle -y
message info "Installing cursor theme..."; mkdir .icons/ && cp -r $DOTFILES/cursor/* .icons/
message info "Installing pywal..."; sudo pip3 install pywal
message info "Installing ulauncher"; sudo dnf install ulauncher -y

# Applying theme + icon pack.
message info "Applying theme + icon pack..."
gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Blue-Dark-Solid"
gsettings set org.gnome.shell.extensions.user-theme name "Flat-Remix-Blue-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set  org.gnome.desktop.interface cursor-theme 'capitaine-cursors'

# Setting wallpapers.
wallpaperDir=$HOME/Pictures/wallpapers/
mkdir $wallpaperDir
cp -r dotfiles/wallpapers/* $wallpaperDir
message info "select a wallpaper "
message quest "(1) Big-Sur \n             (2) Keyboards \n             (3) Cabin in the woods \n             (4) Selena Gomez swimming pool \n             (5) Barbara Palvin \n             (6) Chad \n[1/2/3/4/5/6] "
read -p " " wallpaper
   case ${wallpaper} in
     1) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Big-Sur.jpg;;
     2) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Keyboards.jpg;;
     3) wal -i $wallpaperDir/Cabin-in-the-woods.jpeg && gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Cabin-in-the-woods.jpeg;;
     4) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Selena-Gomez-swimming-pool.jpg;;
     5) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/barbara-palvin.jpg;;
     6) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/barbara-palvin.jpg;;
     *) message error "$WALLPAPER is not a valid option!";;
	esac

# Installling conky + Now Clocking widget.
message info "Installing conky..."
  sudo dnf install conky ffmpeg playerctl -y
  git clone https://github.com/TuX-sudo/gnoti.git
  source ./now-clocking/scripts/download-fonts.sh
  mkdir $HOME/.custom && mv $HOME/now-clocking $HOME/.custom/
  conky -q -c $HOME/.custom/now-clocking/conky/np.lua -d &> /dev/null
  conky -q -c $HOME/.custom/now-clocking/conky/npart.lua -d &> /dev/null

message info "Installing Gnoti..."
   git clone https://gitlab.com/sudo_TuX/gnoti.git
   cd gnoti/

   gnotiPath=$HOME"/.local/share/gnome-shell/extensions/Gnoti@AntonVA.dev"
   mkdir -p ${gnotiPath}
   cp -r ./src/* ${gnotiPath}/
   touch ${gnotiPath}/config.json
   sed "30 i Main.messageTray._bannerBin.x = Right.topright(); // Top right" ./src/extension.js &> ${gnotiPath}/extension.js
   message info "Files copied to ${gnotiPath}"

   cd $HOME

# Installing pop-shell
message info "Installing imagemagick..."; sudo dnf install glib2-devel ImageMagick -y
message info "Installing pop-shell..."; sudo dnf install gnome-extensions-app nodejs-typescript dnf install gnome-shell-extension-pop-shell xprop -y
