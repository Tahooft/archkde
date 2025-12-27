# Uncomment zh_CN.UTF-8 zh_TW.UTF-8
sudo pacman -S wqy-microhei wqy-zenhei
sudo nvim /etc/locale.gen
sudo locale-gen
sudo pacman -S adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts noto-fonts-cjk
