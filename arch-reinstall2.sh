#!/bin/bash
read -p "Введите имя компьютера: " hostname
read -p "Введите имя пользователя: " username

echo 'Прописываем имя компьютера'
echo $hostname > /etc/hostname

echo 'Выбираем часовой пояс'
ln -svf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

echo '3.4 Добавляем русскую локаль системы'
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf
echo "KEYMAP=ru" >> /etc/vconsole.conf
echo "FONT=cyr-sun16" >> /etc/vconsole.conf


echo 'Создадим загрузочный RAM диск'
mkinitcpio -p linux

echo '3.5 Устанавливаем загрузчик'
pacman -Syy
pacman -S grub --noconfirm 
grub-install /dev/sda

echo 'Обновляем grub.cfg'
grub-mkconfig -o /boot/grub/grub.cfg

echo 'Добавляем пользователя'
useradd -m -g users -G wheel -s /bin/bash $username

echo 'Создаем root пароль'
passwd

echo 'Устанавливаем пароль пользователя'
passwd $username

echo 'Устанавливаем SUDO'
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

echo 'Раскомментируем репозиторий multilib Для работы 32-битных приложений в 64-битной системе.'
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
pacman -Syy

echo 'Ставим иксы и драйвера'
pacman -S xorg-server xorg-drivers xorg-xinit --noconfirm

echo 'lightdm'
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm

echo 'Ставим bspwm'
sudo pacman -S bspwm sxhkd i3-gaps dmenu --noconfirm

echo 'Ставим Дополнительное ПО'
sudo pacman -S pcmanfm rofi lxappearance nitrogen polkit-gnome lxtask gparted hardinfo neofetch xorg-xrandr rxvt-unicode urxvt-perls dunst viewnior flameshot sakura leafpad xorg-xev ntfs-3g bash-completion qt5-styleplugins qt5ct mpd mpc ncmpcpp slop xorg-xsetroot firefox firefox-i18n-ru gsimplecal --noconfirm 

echo 'Ставим шрифты'
pacman -S ttf-liberation ttf-dejavu ttf-droid ttf-hack --noconfirm 

echo 'Ставим менеджер сети'
pacman -S networkmanager network-manager-applet ppp --noconfirm

echo 'Подключаем автозагрузку менеджера входа и интернет'
systemctl enable lightdm.service NetworkManager

echo 'Установка завершена! Перезагрузите систему.'
exit
