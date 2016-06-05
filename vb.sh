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

touch /etc/modules-load.d/virtualbox.conf
echo -e vboxguest\\nvboxsf\\nvboxvideo >> /etc/modules-load.d/virtualbox.conf
#install linux-headers
pacamn -S linux-headers
#install vbox guest additions
pacman -S virtualbox-guest-utils --noconfirm
pacman -S virtualbox-guest-modules --noconfirm
pacman -S virtualbox-guest-dkms --noconfirm

#enables services on boot
systemctl enable vboxservice.service

exit
