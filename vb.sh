#!/bin/bash

#install vbox-guest-additions
echo "installing vbox guest additions"
pacman -S virtualbox-guest-utils
pacman -S virtualbox-guest-modules
virtualbox-guest-dkms

#write in conf file
echo "write this in the file, on seperate lines: "
echo "vboxguest vboxsf vboxvideo"
echo -e "[press any button to continue]"
read continue
echo $continue
case $continue in
    "y") nano /etc/modules-load.d/virtualbox.conf;;
    *) nano /etc/modules-load.d/virtualbox.conf;;
esac﻿

#sync time with host
systemctl enable vboxservice.service

exit
