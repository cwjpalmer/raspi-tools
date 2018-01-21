#!/bin/sh

DRIVE=$1
SSID=$2
PSK=$3


# Setup WLAN and SSH on a newly flashed Debian system
# 1. Mount newly flashed drive on your mac
# 2. Run this script, with three arguments:
#		(i)   the path to the drive
# 		(ii)  wifi network name
# 		(iii) wifi password
# 3. Eject the drive, put it in the pi, and boot the pi
# 4. Find the Pi's IP (eg. using LanScan) and SSH in



# Supplicant file configures WLAN settings
SUPPPLICANT_FILE=$DRIVE/wpa_supplicant.conf
touch $SUPPPLICANT_FILE
echo $'ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev\nupdate_config=1\ncountry=DE\n' >> $SUPPPLICANT_FILE
echo $'network={' >> $SUPPPLICANT_FILE
echo $"\tssid=\"$SSID\"" >> $SUPPPLICANT_FILE
echo $"\tpsk=\"$PSK\"" >> $SUPPPLICANT_FILE
echo $"\tkey_mgmt=WPA-PSK" >> $SUPPPLICANT_FILE
echo "}" >> $SUPPPLICANT_FILE

# SSH file enables SSH
SSH_FILE=$DRIVE/ssh
touch $SSH_FILE