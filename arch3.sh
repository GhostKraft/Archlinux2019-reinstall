#!/bin/bash
echo 'Установка AUR (yay)'
sudo pacman -Syy
sudo pacman -S wget --noconfirm
wget git.io/yay-install.sh && sh yay-install.sh
sudo rm -rf ~/yay-install.sh

echo 'Установка программ'
sudo pacman -S firefox ufw --noconfirm
# obs-studio veracrypt freemind filezilla cherrytree gimp libreoffice libreoffice-fresh-ru kdenlive audacity screenfetch vlc qt4 qbittorrent f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils gnome-calculator file-roller p7zip unrar gvfs aspell-ru pulseaudio --noconfirm 
# yay -S dropbox flameshot-git obs-linuxbrowser xflux xflux-gui-git sublime-text2 hunspell-ru pamac-aur --noconfirm 

echo 'Установка тем'
yay -S osx-arc-shadow breeze-obsidian-cursor-theme papirus-maia-icon-theme-git --noconfirm

echo 'Создаем нужные директории'
sudo pacman -S xdg-user-dirs
xdg-user-dirs-update

echo 'Качаем и устанавливаем настройки Xfce'
# Чтобы сделать копию ваших настоек XFCE перейдите в категорию ~/.config/xfce4 открйте в этой категории терминал и выполните команду ниже.
# tar -czf xfce4.tar.gz ~/.config/xfce4
# Выгрузите архив в интернет и скорректируйте ссылку на XFCE файл заменив ссылку на свою.

cd ~/Downloads
wget git.io/xfce4.tar.gz
rm -rf ~/.config/xfce4/*
tar -xzf xfce4.tar.gz -C ~/

echo 'Ставим лого ArchLinux в меню'
wget git.io/arch_logo.png
sudo mv -f ~/arch_logo.png /usr/share/pixmaps/arch_logo.png
rm -rf ~/arch_logo.png

echo 'Ставим обои на рабочий стол'
wget git.io/bg.jpg
sudo rm -rf /usr/share/backgrounds/xfce/* #Удаляем стандартрые обои
sudo mv -f ~/bg.jpg /usr/share/backgrounds/xfce/bg.jpg
rm -rf ~/bg.jpg


echo 'Включаем сетевой экран'
sudo ufw enable

echo 'Установка завершена!'
rm -rf ~/arch3.sh
