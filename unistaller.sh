#!/bin/bash

#remove directories and files created
rm -rf ~/.icons/Oxygen\ 14\ Matrix\ Green
rm -rf ~/.themes
rm -rf ~/.videos/MATRIX.wmv
rm -rf ~/.documents

#reset GTK theme to default
gsettings set org.gnome.desktop.interface gtk-theme "Yaru"

#reset cursor theme to default
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'

#remove MATRIX video and wallpaper
rm -rf ~/gpu-video-wallpaper
rm -rf ~/.config/autostart/gpu-video-wallpaper.desktop

#remove terminal background color and prompt
profile=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F ' '{print $2}')
gsettings reset org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$profile"/ background-color
sed -i '/export PS1/d' ~/.bashrc

#uninstall unnecessary packages
sudo apt remove -y gnome-tweaks curl python3-pip git cmatrix xorg-dev libx11-dev libxext-dev
sudo apt autoremove -y
