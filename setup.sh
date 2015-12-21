#  Copyright 2015 thewatcher <thewatcher@thewatcher>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#



#!/bin/bash
#echo prints things to the terminal

#gets updates
pacman -Syu

#install vbox-guest-additions
pacman -S virtualbox-guest-utils --noconfirm
pacman -S virtualbox-guest-modules --noconfirm
pacman -S virtualbox-guest-dkms --noconfirm

#create conf file
echo "write this: vboxguest, vboxsf, vboxv without commas"
echo "on seperate lines"
nano /etc/modules-load.d/virtualbox.conf

#sync time with host
systemctl enable vboxservice.service

#installs xorg
pacman -S xorg-server --noconfirm
pacman -S xorg-server-utils --noconfirm
pacman -S xorg-apps --noconfirm

#adds user called flex and set password
echo -e "enter new username"
read name
useradd -m -G wheel -s /bin/bash $name
echo "set password for $name"
passwd $name

#installs sudo
pacman -S sudo --noconfirm

#configure sudo
echo "remove the hashtag before the line"
echo "%wheel ALL=(ALL) ALL"
nano /etc/sudoers

#installs xorg-xinit and twm and xorg-xclock
pacman -S xorg-twm --noconfirm
pacman -S xorg-xinit --noconfirm
pacman -S xorg-xclock --noconfirm

#starts graphical session
echo "a graphical session will be started"
startx

#choose desktop environment
echo "what desktop environment do you want to use?"
echo -e "[xfce][gnome][openbox][KDE]"
read answer
case $answer in
    "xfce") pacman -S xfce4 --noconfirm;;
    "gnome") pacman -S gnome-desktop --noconfirm;;
    "openbox") pacman -S openbox --noconfirm;;
    "KDE") pacamn -S plasma kde-applications --noconfirmm;;
    *) echo "Sorry, your selection was not on the list";;
esac﻿
