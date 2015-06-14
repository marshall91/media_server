#!/bin/bash

# Mack's script for the pi server
# sudo ./media_server.sh

apt-get update

# Install vim
apt-get install vim

# Mount the drive
apt-get install -y ntfs-3g
mount /dev/sda1 /mnt
chmod 775 /mnt

# Install MiniDLNA
apt-get install -y minidlna
# copy the new dlna config
cp /mnt/PiConf/minidlna.conf /etc/minidlna.conf
minidlna -R
service minidlna restart

# Install Samba
apt-get install -y samba samba-common-bin
# copy new Samba config
cp /mnt/PiConf/smb.conf /etc/samba/smb.conf
service samba restart

# Install Transmission
apt-get install -y transmission-daemon
service transmission-daemon stop
# copy new Transmission config
cp /mnt/PiConf/settings.json /etc/transmission-daemon/settings.json
service transmission-daemon start
