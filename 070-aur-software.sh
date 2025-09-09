#!/bin/bash
set -e

###############################################################################
echo "Installation of yay"
###############################################################################

func_install() {
	if yay -Qia $1 &> /dev/null; then
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
    	yay -aS --noconfirm --needed $1 
    fi
}

###############################################################################
echo "Installation of the aur packages"
###############################################################################

list=(
backintime
backintime-cli
brave-bin
btrfs-assistant
btrfs-desktop-notification
clamav-unofficial-sigs
ddev-bin
# dropbox
#nomacs #  	A Qt image viewer
# phoronix-test-suite
sublime-text-4
# subtitleedit
tamsyn-font
# tealdeer   # concise man pages 
visual-studio-code-bin
youtube-dl
)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

###############################################################################

tput setaf 11;
echo "################################################################"
echo "Software has been installed"
echo "################################################################"
echo;tput sgr0
