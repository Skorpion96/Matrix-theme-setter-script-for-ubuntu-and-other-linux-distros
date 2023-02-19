#!/bin/bash

# create directories
mkdir -p ~/.icons
mkdir -p ~/.themes
mkdir -p ~/.videos
mkdir -p ~/.documents

sudo chmod -R 777 ~/.icons
sudo chmod -R 777 ~/.themes
sudo chmod -R 777 ~/.videos
sudo chmod -R 777 ~/.documents

# install necessary packages
sudo apt install -y gnome-tweaks curl python3-pip git cmatrix xorg-dev libx11-dev libxext-dev

# install mediafire-dl
pip3 install mediafire-dl

# download and set GTK theme
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-Viridian-Dark"

# download and set cursor theme
sudo apt install python -y
pip install tqdm
pip3 install git+https://github.com/Juvenal-Yescas/mediafire-dl
mediafire-dl https://www.mediafire.com/file/8mfwhasojxr261u/Oxygen_14_Matrix_Green.tar/file
tar xvzf "Oxygen 14 Matrix Green.tar"
sudo cp -R "Oxygen 14 Matrix Green" ~/.icons
gsettings set org.gnome.desktop.interface cursor-theme 'Oxygen 14 Matrix Green'

# copy MATRIX video and set as wallpaper
git clone https://github.com/ghostlexly/gpu-video-wallpaper.git
mediafire-dl https://www.mediafire.com/file/vlq98ajxi9blfss/MATRIX.wmv/file
cp -R MATRIX.wmv ~/.videos
cd gpu-video-wallpaper
./install.sh
sh video-wallpaper.sh --startup ~/.videos/MATRIX.wmv
cd ..

# set terminal background color and prompt
profile=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$profile"/ background-color '#000000'
echo 'export PS1="\[\e[0;32m\][\u@\h \W]\$\[\e[m\] "' >> ~/.bashrc
