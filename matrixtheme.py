import subprocess
import os

os.makedirs(os.path.expanduser("~/.icons"), exist_ok=True)
os.makedirs(os.path.expanduser("~/.themes"), exist_ok=True)
os.makedirs(os.path.expanduser("~/.videos"), exist_ok=True)
os.makedirs(os.path.expanduser("~/.documents"), exist_ok=True)

subprocess.run(["sudo", "chmod", "-R", "777", os.path.expanduser("~/.icons")])
subprocess.run(["sudo", "chmod", "-R", "777", os.path.expanduser("~/.themes")])
subprocess.run(["sudo", "chmod", "-R", "777", os.path.expanduser("~/.videos")])
subprocess.run(["sudo", "chmod", "-R", "777", os.path.expanduser("~/.documents")])

subprocess.run(["sudo", "apt", "install", "-y", "gnome-tweaks", "curl", "python3-pip", "git", "cmatrix", "xorg-dev", "libx11-dev", "libxext-dev"])

subprocess.run(["gsettings", "set", "org.gnome.desktop.interface", "gtk-theme", "Yaru-Viridian-Dark"])

subprocess.run(["sudo", "apt", "install", "python", "-y"])
subprocess.run(["pip", "install", "tqdm"])
subprocess.run(["pip3", "install", "git+https://github.com/Juvenal-Yescas/mediafire-dl"])
subprocess.run(["mediafire-dl", "https://www.mediafire.com/file/8mfwhasojxr261u/Oxygen_14_Matrix_Green.tar/file"])
subprocess.run(["tar", "xvzf", "Oxygen 14 Matrix Green.tar"])
subprocess.run(["sudo", "cp", "-R", "Oxygen 14 Matrix Green", os.path.expanduser("~/.icons")])
subprocess.run(["gsettings", "set", "org.gnome.desktop.interface", "cursor-theme", "Oxygen 14 Matrix Green"])

subprocess.run(["git", "clone", "https://github.com/ghostlexly/gpu-video-wallpaper.git"])
subprocess.run(["mediafire-dl", "https://www.mediafire.com/file/vlq98ajxi9blfss/MATRIX.wmv/file"])
subprocess.run(["cp", "-R", "MATRIX.wmv", os.path.expanduser("~/.videos")])
os.chdir("gpu-video-wallpaper")
subprocess.run(["./install.sh"])
subprocess.run(["sh", "video-wallpaper.sh", "--startup", os.path.expanduser("~/.videos/MATRIX.wmv")])
os.chdir("..")

profile = subprocess.run(["gsettings", "get", "org.gnome.Terminal.ProfilesList", "default"], capture_output=True, text=True).stdout.strip().replace("'", "")
subprocess.run(["gsettings", "set", "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:" + profile + "/", "background-color", "#000000"])
with open(os.path.expanduser("~/.bashrc"), "a") as f:
    f.write('export PS1="\\[\\e[0;32m\\][\\u@\\h \\W]\\$\\[\\e[m\\] "\n')
