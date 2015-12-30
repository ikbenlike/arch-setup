#  setup.sh
#  
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

#add new user
echo -e "what do you want to call the new user?"
read user
useradd $user
passwd $user

#install sudo
pacman -Syu sudo --noconfirm

#install xorg stuffs
pacman -S xorg-xserver --noconfirm
pacman -S xorg-server-utils --noconfirm
pacman -S xorg-apps --noconfirm
pacman -S xorg-twm --noconfirm
pacman -S xorg-xclock --noconfirm
pacman -S xterm --noconfirm
pacman -S xorg-xinit --noconfirm

#vbox vm or not
echo -e "is this a Virtualbox VM? [Y/n]"
read vm
case $vm in
	"y") sh vb.sh;;
	"Y") sh vb.sh;;
	*) echo "virtualbox guest additions will not be installed";;
esac

#choose desktop environment 
echo "what desktop environment do you want to install?"
echo -e "[gnome][xfce][kde][mate][mate-gtk3][cinnamon][lxde][lxqt][deepin][enlightenment]"
read desktop
case $desktop in
	"gnome") pacman -S gnome gnome-extra --noconfirm;;
	"xfce") pacman -s xfce4 xfce4-goodies --noconfirm;;
	"kde") pacman -S plasma --noconfirm;;
	"mate") pacman -S mate mate-extra --noconfirm;;
	"mate-gtk3") pacman -S mate-gtk3 mate-extra-gtk3 --noconfirm;;
	"cinnamon") pacman -S cinnamon --noconfirm;;
	"lxde") pacman -S lxde-common lxde --noconfirm;;
	"lxqt") pacman -S lxqt oxygen-icons --noconfirm;;
	"deepin") pacman -S deeping deepin-extra --noconfirm;;
	"enlightenment") pacman -S enlightenment --noconfirm;;
	*) echo "your choice was not available";;
esac

#choose display manager
echo "what display manager do you want to use?"
echo -e "[gdm][lightdm][lxdm][sddm][xdm]"
read manager
case $manager in
	"gdm") pacman -S gmd --noconfirm && systemctl enable gdm.service;;
	"lightdm") pacman -S lightdm --noconfirm && systemctl enable lightdm.service;;
	"lxdm") pacman -S lxdm --noconfirm && systemctl enable lxdm.service;;
	"sddm") pacman -S sddm --noconfirm && systemctl enable sddm.service;;
	"xdm") pacman -S xorg-xdm --noconfirm && systemctl enable xdm.service;;
	*) echo "the option you chose is not available"
esac
