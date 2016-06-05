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

#gets updates
pacman -Syu --noconfirm

while [ 1 ]; do
    echo -e "is this a virtualbox VM? y/n"
    read vbvm
    echo $vbvm
    case $vbvm in
        "y")
        sh vb.sh
        break
        ;;
        "Y")
        sh vb.sh
        break
        ;;
        "yes")
        sh vb.sh
        break
        ;;
        "n")
        sh vb.sh
        break
        ;;
        "N")
        sh vb.sh
        break
        ;;
        "no")
        sh vb.sh
        break
        ;;
        *) echo "Invalid input $vbvm";;
    esac
done

#installs sudo
pacman -S sudo --noconfirm
#add sudo config file
mv ./sudoers /etc/sudoers

#adds user and sets password
echo -e "enter new username:"
read name
echo "set password for $name:"
useradd -mG wheel -s /bin/bash $name
passwd $name
groupadd sudo
groupadd admin
usermod -aG sudo $name
usermod -aG admin $name

#installs xorg
pacman -S xorg-server --noconfirm
pacman -S xorg-server-utils --noconfirm
pacman -S xorg-apps --noconfirm
#installs xorg-xinit and twm and xorg-xclock
pacman -S xorg-twm --noconfirm
pacman -S xorg-xinit --noconfirm
pacman -S xorg-xclock --noconfirm
pacman -S xterm --noconfirm

#choose desktop environment
echo "what desktop environment do you want to use?"
while [ 1 ]; do
    echo -e "[xfce][gnome][openbox][KDE][cinnamon][mate][mate-gtk3][none]"
    read de
    case $de in
        "xfce")
        pacman -S xfce4 --noconfirm
        break
        ;;
        "gnome")
        pacman -S gnome --noconfirm
        break
        ;;
        "openbox")
        pacman -S openbox --noconfirm
        break
        ;;
        "KDE")
        pacman -S plasma kde-applications --noconfirmm
        break
        ;;
        "cinnamon")
        pacman -S cinnamon --noconfirm
        break
        ;;
        "mate")
        pacman -S mate --noconfirm
        break
        ;;
        "mate-gtk3")
        pacman -S mate-gtk3 --noconfirm
        break
        ;;
        "none")
        break
        ;;
        *) echo "Sorry, your selection was not on the list";;
    esac
done

#choose display manager
echo "what display manager do you want to use?"
while [ 1 ]; do
    echo -e "[GDM][LightDM][LXDM][SDDM][SLiM][XDM][none]"
    read displaymanager
    case $displaymanager in
        "GDM")	#if user wants GDM
        pacman -S gdm --noconfirm
        systemctl enable gdm.service
        break
        ;;
        "gdm")	#if user wants GDM
        pacman -S gdm --noconfirm
        systemctl enable gdm.service
        break
        ;;
        "LightDM")	#if user wants LightDM
        pacman -S lightdm --noconfirm
        systemctl enable lightdm.service
        break
        ;;
        "lightdm")	#if user wants LightDM
        pacman -S lightdm --noconfirm
        systemctl enable lightdm.service
        break
        ;;
        "LXDM")		#if user wants LXDM
        pacman -S lxdm --noconfirm
        systemctl enable lxdm.service
        break
        ;;
        "lxdm")		#if user wants LXDM
        pacman -S lxdm --noconfirmm
        systemctl enable lxdm.service
        break
        ;;
        "SDDM")		#if user wants SDDM
        pacman -S sddm --noconfirm
        systemctl enable sddm.service
        break
        ;;
        "sddm")		#if user wants SDDM
        pacman -S sddm --noconfirm
        systemctl enable sddm.service
        break
        ;;
        "SLiM")		#if user wants SLiM
        pacman -S slim --noconfirm
        systemctl enable slim.service
        break
        ;;
        "slim")		#if user wants SLiM
        pacman -S slim --noconfirm
        systemctl enable slim.service
        break
        ;;
        "XDM")		#if user wants XDM
        pacman -S xorg-xdm --noconfirm
        systemctl enable xdm.service
        break
        ;;
        "xdm")		#if user wants XDM
        pacman -S xorg-xdm --noconfirm
        systemctl enable xdm.service
        break
        ;;
        "none")		#if user doesn't want a display manager
        break
        ;;
        *) 			#if input is not a valid name
        echo -e "Invalid input \"$displaymanager\""
        ;;
    esac
done

#ask for reboot
while [ 1 ]; do
    echo -e "do you want to reboot now? y/n"
    read reboot
    case $reboot in
        "y")
        reboot now
        break
        ;;
        "Y")
        reboot now
        break
        ;;
        "yes")
        reboot now
        break
        ;;
        "n")
        break
        ;;
        "N")
        break
        ;;
        "no")
        break
        ;;
        *) echo "Invalid input $reboot";;
    esac
done

#ask if user wants to start an X-session
while [ 1 ]; do
    echo -e "do you want to start an X-server? y/n"
    read x
    case $x in
        "y")
        startx
        break
        ;;
        "yes")
        startx
        break
        ;;
        "n")
        echo "exiting script..."
        break
        ;;
        "no")
        echo "exiting script..."
        break
        ;;
        *) echo "Invalid input $x";;
    esac
done


exit
