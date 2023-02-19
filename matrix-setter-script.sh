#!/bin/sh
mkdir ~/.icons
mkdir ~/.themes
mkdir ~/.videos 
mkdir ~/.documents
sudo apt install gnome-tweaks -y
sudo apt install curl -y
sudo gsettings set org.gnome.desktop.interface gtk-theme "Yaru-Viridian-Dark"
curl "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1509460911/Oxygen%2014%20Matrix%20Green.tar.gz?response-content-disposition=attachment%3B%2520Oxygen%2014%20Matrix%20Green.tar.gz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20230219%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230219T110335Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=9f182dc076c50a42acc0d0e9230c8e13db59fa041468f614cb892a86f8105cfd" --output "Oxygen 14 Matrix Green.tar"
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








