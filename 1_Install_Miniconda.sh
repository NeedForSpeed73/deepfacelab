#!/bin/bash
#

# Install Miniconda
printf %"s\n" "" "* Downloading Miniconda3-latest" ""
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

printf %"s\n" "" "* Installing Miniconda3-latest" ""
sh ./Miniconda3-latest-Linux-x86_64.sh

printf %"s\n" "" "* Cleaning Up" ""
rm Miniconda3-latest-Linux-x86_64.sh

# Banner Message
printf %"s\n" "" "***************************************************************"
printf %"s\n" "* NOW LOGOUT (CLOSE) THIS SHELL AND RE-OPEN TO ACTIVATE CONDA *"
printf %"s\n" "***************************************************************" ""