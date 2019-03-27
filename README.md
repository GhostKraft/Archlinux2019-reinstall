#############################################################
# ArchLinux Fast reinstall v1.0.0 
#############################################################

# Описание (RU)
Этот скрипт переустановит систему на уже созданные разделы без форматирования домашнего раздела home, с целью сохранения личных данных и файлов. Работает только в том случае если домашний раздел (home) вынесен отдельно. 

Разметка MBR c BIOS: sda1 boot | sda2 swap | sda3 root | sda4 extended | sda5 home

Графическое окружение XFCE
Экран входа lightdm

Данный скрипт является форком скрипта ordanax/arch2018 https://github.com/ordanax/arch2018 

Cостоит из 2 частей: часть1- https://git.io/fjUo1  | часть2- https://git.io/fjUoD

# Установка 
1) Скачать и записать на флешку ISO образ Arch Linux https://www.archlinux.org/download/
2) Скачать и запустить скрипт командой:

   ```bash 
   wget git.io/fjUo1.sh && sh fjUo1.sh
   ```

Запустится установка минимальной системы с DE XFCE.

2-я часть ставится автоматически и это базовая установка ArchLinux без программ и настроек, но с возможностью выбора имени компьютера и пользователя, а так же установкой паролей. 

# Настройка скрипта под себя
Вы можете форкнуть этот срипт. Изменить разметку дисков под свои нужды, залить его на Github и производить быструю переустановку вашей системы.
По завершению работы скрипта вы получаете вашу готовую систему.

# ВНИМАНИЕ!!!
Автор не несет ответственности за любое нанесение вреда при использовании скрипта. Используйте его на свой страх и риск предварительно изучив и если нужно изменив под свои личные нужды.

Перед запуском внимательно проверьте разметку диска которая используется в даннов скрипте и при надобности поменяйте под себя

Скрипр расчитан на переустановку ARCH LINUX с уже созданной разметкой диска MBR и форматированием разделов boot, swap, root:

sda1 boot (форматируется)

sda2 swap (форматируется)

sda3 root (форматируется)

sda4 extended

sda5 home (форматирование не производится)




#############################################################
# ArchLinux Fast reinstall v1.0.0 
#############################################################
# Description (EN)
This script will reinstall the system on already created partitions without formatting home in order to save personal data and files. This script only works if the home partition is separate from the root partition.

MBR markup with BIOS: sda1 boot | sda2 swap | sda3 root | sda4 extended | sda5 home 

XFCE graphic environment 

Lightdm login screen 

This script is a fork of the ordanax / arch2018 script https://github.com/ordanax/arch2018

Consists of 2 parts: part1- https://git.io/fjUo1 | part2- https://git.io/fjUoD

# Installation
1) Download and burn the Arch Linux ISO image on a USB flash drive https://www.archlinux.org/download/
2) Download and run the script with the command:

   ``` bash
   wget git.io/fjUo1.sh && sh fjUo1.sh
   ```

The installation of the minimum system with DE XFCE starts.
   
Part 2 is automatically installed and this is the basic installation of ArchLinux without programs and settings.


# Customize the script for yourself
You can fork this script. Change disk layout to fit your needs, upload it to Github and perform a quick reinstall of your system.
Upon completion of the script, you get your ready-made system.

# ATTENTION!
The author is not responsible for any harm when using the script. Use it at your own risk and having previously studied it and, if necessary, changing it for your personal needs.

Before starting, carefully check the disk layout used in this script and change it if necessary.
Script is designed for re-installing ARCH LINUX with the MBR partitioning already created and formatting boot, swap, root partitions:

sda1 boot (formatted)

sda2 swap (formatted)

sda3 root (formatted)

sda4 extended

sda5 home (no formatting)



# История изменений (Change History)

### 27.03.2019 Archlinux2019-reinstall v1.0.0

- Релиз (Release)
