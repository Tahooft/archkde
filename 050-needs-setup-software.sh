#!/bin/bash
# Based on: https://github.com/erikdubois/arcolinux-nemesis
#
# @ToDo

set -e


# echo "####             Wireshark                            ###"
    sudo pacman -Ss wireshark
    sudo pacman -S wireshark-qt
    sudo usermod -aG wireshark $USER
# echo "####             Wireshark done                              ###"


echo "####             Enable GUFW simple firewall                 ###"
sudo pacman -S ufw gufw ufw-extras --noconfirm --needed
sudo ufw enable
sudo systemctl enable ufw
sudo systemctl start ufw
# echo "###################    GUFW enabled       ######################"


# echo "####             Enable systemd-boot-update                  ###"
# #sudo systemctl enable systemd-boot-update
# echo "###################    systemd-boot-update enabled #############"


# echo "####             MKCERT - needed for DDEV                    ###"
# # sudo pacman -S mkcert --noconfirm --needed
# # mkcert -install
# echo "###################    MKCERT -install done ####################"


echo "####             CREATE KEYPAIR                              ###"
# create keypair if missing - ook voor GIT nodig
sudo ssh-keygen -A

echo "###################    KEYPAIR GENERATED    ####################"


# echo "####             CRON                                        ###"
# #if pacman -Qi cron &> /dev/null; then
# #    sudo pacman -S cron --noconfirm --needed
# #fi
# #sudo systemctl start cronie
# #sudo systemctl enable cronie
# echo "###################    CRON DONE            ####################"


echo "####             SETUP DOCKER                                ###"
sudo pacman -S docker docker-compose --noconfirm --needed
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker
echo "###################    DOCKER SETUP DONE    ####################"


# echo "###################    BLUETOOTH SETUP      ####################"
# #sudo systemctl start bluetooth.service
# #sudo systemctl enable bluetooth.service
echo "###################    BLUETOOTH SETUP DONE    #################"


echo "###################    PRINTER SETUP        ####################"
sudo pacman -S cups print-manager hplip python-pyqt5 --noconfirm --needed
sudo systemctl enable cups
echo "###################    PRINTER SETUP DONE      #################"


echo "###################    FSTRIM  SETUP        ####################"
# sudo systemctl start fstrim.timer
# sudo systemctl enable fstrim.timer
echo "###################    FSTRIM  SETUP DONE   ####################"
