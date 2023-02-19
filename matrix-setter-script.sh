#!/bin/sh
mkdir ~/.icons
mkdir ~/.themes
mkdir ~/.videos 
mkdir ~/.documents
sudo apt install gnome-tweaks -y
sudo apt install curl -y
sudo gsettings set org.gnome.desktop.interface gtk-theme "Yaru-Viridian-Dark"
curl https://www.mediafire.com/file/8mfwhasojxr261u/Oxygen_14_Matrix_Green.tar/file --output "Oxygen 14 Matrix Green.tar"
tar xvzf "Oxygen 14 Matrix Green.tar"
sudo cp "Oxygen 14 Matrix Green" ~/.icons
sudo gsettings set org.gnome.desktop.interface cursor-theme 'Oxygen 14 Matrix Green'
sudo apt install cmatrix -y
sudo cp -R "MATRIX.wmv" ~/.videos
sudo apt install git -y
git clone "https://github.com/ghostlexly/gpu-video-wallpaper.git"
curl https://www.mediafire.com/file/y7ey8whbifjuaie/xwinwrap/file --output "xwinwrap"
sudo cp -R xwinwrap gpu-video-wallpaper
cd gpu-video-wallpaper
sudo ./install.sh
cd ..
sudo cp -R MATRIX.wmv ~/.videos
sudo sh video-wallpaper.sh --startup ~/.videos/MATRIX.wmv
sudo echo 'export PS1="\e[0;32[\u@\h \W]\$ \e[m "' >> ~/.bashrc
sudo gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')"/ background-color '#000000'








