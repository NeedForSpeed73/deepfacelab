#!/bin/bash
#

if [ "$#" -ne 1 ]; then
  printf %"s\n" "Usage: 3_Add_Swap <swapfile dimension in Gigabytes>"
else
	printf %"s\n" "" "* Turning off existing swap" ""
	sudo swapoff -a
	if [ -f /swapfile ]; then 
		printf %"s\n" "" "* Deleting existing swapfile" ""
        sudo rm /swapfile
	fi
	printf %"s\n" "" "* Creating new swapfile and activating swap on it" ""
	sudo fallocate -l $1G /swapfile
	sudo chmod 600 /swapfile
	sudo mkswap /swapfile
	sudo swapon /swapfile
fi
