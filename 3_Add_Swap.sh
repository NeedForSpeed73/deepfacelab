#!/bin/bash
#

if [ "$#" -ne 1 ]; then
  echo "Usage: 3_Add_Swap <swapfile dimension in Gigabytes>"
else
  sudo swapoff -a
  if [ -f /swapfile ]; then 
        sudo rm /swapfile
  fi
  sudo fallocate -l $1G /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile
fi
