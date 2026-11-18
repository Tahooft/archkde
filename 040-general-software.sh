#!/bin/bash
set -e

func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Installing package "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1 
    fi
}

###############################################################################
echo "Installation of the development packages"
###############################################################################

list=(

## Nvidia
nvidia-container-toolkit #  allows users to build and run GPU-accelerated containers

### AI setup
# ollama-cuda


### Plasma+
kdeconnect
kdenlive
ksystemlog
kompare
k3b
skanlite
kleopatra
ktouch
kajongg
kasts
kalm
audex
krename
kid3
# plasma-camera

### Connect to iPad 
gvfs
ifuse
# iw # nl80211 based CLI configuration utility for wireless device
libimobiledevice

### Fonts, Icons & Themes
adobe-source-sans-fonts
adwaita
awesome-terminal-fonts
noto-fonts
noto-fonts-emoji
ttf-nerd-fonts-symbols # Nice for neovim
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-font-awesome
ttf-hack
ttf-inconsolata
ttf-liberation
ttf-roboto
ttf-ubuntu-font-family
oxygen-icons
adapta-gtk-theme
breeze5
gtk-theme-elementary

### Other software
arch-audit
audacity
baobab # Disk Usage Analyzer
bash-completion
bash-language-server
bat
btrfs-progs
btrfs-assistant
catfish
chromium
clamav
cpupower 	# Linux kernel tool to examine and tune power saving related features of your processor
# cronie
flatpak
firefox
firefox-adblock-plus
fwupd
gimp
gimp-plugin-gmic
git
# gnome-boxes
gnome-disk-utility
gnome-mahjongg
gparted
grub-btrfs
gsmartcontrol
hblock	# adblocker - maybe needs setup
hddtemp
hdparm
hwinfo
# hplip
# i7z 	# A better i7 (and now i3, i5) reporting tool for Linux
intel-ucode	# Microcode update files for Intel CPUs
inxi
jellyfin-ffmpeg
koko # A simple and fast image viewer for KDE
libreoffice-fresh
libusb-compat
logrotate
lshw
man-db
man-pages
# meld
mkvtoolnix-cli # Set of tools to create, edit and inspect Matroska files
mkvtoolnix-gui
most
mpv
ncdu
# neofetch
neovim
nvtop	# GPUs process monitoring for AMD, Intel and NVIDIA
# power-profiles-daemon # Makes power profiles handling available over D-Bus
pacman-contrib # includes oa pactree
pychess
rsync
seahorse
sysstat	# real time drive usage. example: iostat -xh 1 5 --- toont drives (x=? h=human readble 1=update in seconds 5=how often)
thunar
thunar-archive-plugin
thunar-media-tags-plugin
thunar-volman
tmux
tree
usb_modeswitch
usbutils
vlc
vlc-plugins-all
volumeicon
wikiman
wl-clipboard
yt-dlp

# XFCE4
# xfce4
# garcon
# xfwm4
# xfdesktop
# xfce4-session
# arandr
# autorandr
# arc-gtk-theme

)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

export MANPAGER=less

###############################################################################

tput setaf 11;
echo "################################################################"
echo "Software has been installed"
echo "################################################################"
echo;tput sgr0

echo;tput sgr0

# xrdb ~/.Xresources

tput setaf 11;
echo "################################################################"
echo " Updated ~/.Xresources --- if not set as commented
echo "################################################################"
echo;tput sgr0
