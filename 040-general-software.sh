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

# Plasma+
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
plasma-camera

# Connect to iPad 
gvfs
ifuse
libimobiledevice


adapta-gtk-theme
adobe-source-sans-fonts
arandr
arc-gtk-theme
arch-audit
audacity
autorandr
awesome-terminal-fonts
baobab # Disk Usage Analyzer
bash-completion
bash-language-server
bat
catfish
chromium
clamav
# cpupower 	# (Flagget out of date)  Linux kernel tool to examine and tune power saving related features of your processor
cronie
flatpak
firefox
firefox-adblock-plus
gimp
gimp-plugin-gmic
git
gnome-boxes
gnome-disk-utility
gnome-mahjongg
gparted
grub-btrfs
gsmartcontrol
gtk-theme-elementary
hblock	# adblocker - maybe needs setup
hddtemp
hdparm
hwinfo
# hplip
imagemagick
i7z 	# A better i7 (and now i3, i5) reporting tool for Linux
intel-ucode	# Microcode update files for Intel CPUs
inxi
jellyfin-ffmpeg
libreoffice-fresh
libusb-compat
logrotate
lshw
man-db
man-pages
# meld
most
mpv
neofetch
neovim
network-manager-applet
noto-fonts
# nvidia 
# nvidia-utils 
# nvidia-settings
# nvidia-prime
nvtop	# GPUs process monitoring for AMD, Intel and NVIDIA
oxygen-icons
# power-profiles-daemon # Makes power profiles handling available over D-Bus
pychess
rsync
# samba
seahorse
# simple-scan
sysstat	# real time drive usage. example: iostat -xh 1 5 --- toont drives (x=? h=human readble 1=update in seconds 5=how often)
ttf-nerd-fonts-symbols # Nice for neovim
telegram-desktop
thunar
thunar-archive-plugin
thunar-media-tags-plugin
thunar-volman
tmux
tree
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-font-awesome
ttf-hack
ttf-inconsolata
ttf-liberation
ttf-roboto
ttf-ubuntu-font-family
usb_modeswitch
usbutils
vlc
vlc-plugins-all
volumeicon
wikiman
yt-dlp
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
