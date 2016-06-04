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
pacman -Syu

echo -e "is this a virtualbox VM? y/n"
read vbvm
echo $vbvm
case $vbvm in
    "y") sh vb.sh;;
    *) echo "the guest additions will not be installed";;
esac

#installs sudo
pacman -S sudo --noconfirm
#add sudo config file
mv /sudoers /etc/sudoers

#adds user and sets password
echo -e "enter new username"
read name
echo "set password for $name"
passwd $name
useradd -mG wheel -s /bin/bash $name
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

#choose desktop environment
echo "what desktop environment do you want to use?"
echo -e "[xfce][gnome][openbox][KDE][cinnamon][mate][mate-gtk3]"
read answer
case $answer in
    "xfce") pacman -S xfce4 --noconfirm;;
    "gnome") pacman -S gnome-desktop --noconfirm;;
    "openbox") pacman -S openbox --noconfirm;;
    "KDE") pacman -S plasma kde-applications --noconfirmm;;
    "cinnamon") pacman -S cinnamon --noconfirm;;
    "mate") pacman -S mate --noconfirm;;
    "mate-gtk3") pacman -S mate-gtk3 --noconfirm;;
    *) echo "Sorry, your selection was not on the list";;
esac

#choose display manager
echo "what display manager do you want to use?"
while [ 1 ]; do
    echo -e "[GDM][KDM][LightDM][LXDM][MDM][Qingy][SDDM][SLiM][XDM][none]"
    read displaymanager
    case $displaymanager in
        "GDM")	#if user wants GDM
        pacman -S gdm --noconfirm
        systemctl enable gdm.service
        ;;
        "gdm")	#if user wants GDM
        pacman -S gdm --noconfirm
        systemctl enable gdm.service
        ;;
        "LightDM")	#if user wants LightDM
        pacman -S lightdm --noconfirm
        systemctl enable lightdm.service
        ;;
        "lightdm")	#if user wants LightDM
        pacman -S lightdm --noconfirm
        systemctl enable lightdm.service
        ;;
        "LXDM")		#if user wants LXDM
        pacman -S lxdm --noconfirmm
        systemctl enable lxdm.service
        ;;
        "lxdm")		#if user wants LXDM
        pacman -S lxdm --noconfirmm
        systemctl enable lxdm.service
        ;;
        "SDDM")		#if user wants SDDM
        pacman -S sddm --noconfirm
        systemctl enable sddm.service
        ;;
        "sddm")		#if user wants SDDM
        pacman -S sddm --noconfirm
        systemctl enable sddm.service
        ;;
        "SLiM")		#if user wants SLiM
        pacman -S slim --noconfirm
        systemctl enable slim.service
        ;;
        "slim")		#if user wants SLiM
        pacman -S slim --noconfirm
        systemctl enable slim.service
        ;;
        "XDM")		#if user wants XDM
        pacman -S xorg-xdm --noconfirm
        systemctl enable xdm.service
        ;;
        "xdm")		#if user wants XDM
        pacman -S xorg-xdm --noconfirm
        systemctl enable xdm.service
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
echo -e "do you want to reboot now? y/n"
read reboot
case $reboot in
    "y") reboot now;;
    *) echo "system will not reboot";;
esac

#ask if user wants to start an X-session
echo -e "do you want to start an X-server? y/n"
read x
case $x in
    "y") startx;;
    "yes") startx;;
    "n") echo "exiting script...";;
    "no") echo "exiting script...";;
esac


exit
