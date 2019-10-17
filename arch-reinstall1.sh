#!/bin/bash

# Arch Linux Fast reinstall - Быстрая переустановка Arch Linux
# Цель скрипта - быстрая переустановка системы на уже созданные разделы (с учетом того что home вынесен отдельно) без форматирования home с целью сохранения личных данных и файлов
# Автор форка GhostKraft https://github.com/GhostKraft

setfont cyr-sun16
loadkeys ru
echo 'Скрипт сделан на основе скрипта Бойко Алексея Arch Linux Fast Install https://github.com/ordanax/arch2018'

echo '2.3 Синхронизация системных часов'
timedatectl set-ntp true

echo 'Ваша разметка диска'
fdisk -l

echo '2.4.2 Форматирование дисков'
mkfs.ext2  /dev/sda1 -L boot
mkswap /dev/sda2 -L swap
mkfs.ext4  /dev/sda3 -L root

echo '2.4.3 Монтирование дисков'
mount /dev/sda3 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sda5 /mnt/home
swapon /dev/sda2

echo '3.1 Выбор зеркал для загрузки. Ставим зеркало от Яндекс'
echo "Server = https://mirror.yandex.ru/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman -Syyu

echo '3.2 Установка основных пакетов и ядра'
pacstrap /mnt base base-devel linux linux-firmware dhcpcd nano

echo '3.3 Настройка системы, создание FSTAB'
genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL git.io/fjUoD)"
