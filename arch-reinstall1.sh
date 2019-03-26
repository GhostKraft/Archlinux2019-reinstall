#!/bin/bash

# Arch Linux Fast reinstall - Быстрая переустановка Arch Linux с сохранением данных на домашнем (home) разделе
# Цель скрипта - быстрая переустановка системы на уже созданные разделы без форматирования home с целью сохранения личных файлов

loadkeys ru
setfont cyr-sun16
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
echo "Server = http://mirror.yandex.ru/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist

echo '3.2 Установка основных пакетов'
pacstrap /mnt base base-devel

echo '3.3 Настройка системы, создание FSTAB'
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL git.io/fjUoD)"
