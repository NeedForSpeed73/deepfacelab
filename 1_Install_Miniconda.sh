#!/bin/bash
#

# Install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh ./Miniconda3-latest-Linux-x86_64.sh
rm Miniconda3-latest-Linux-x86_64.sh

echo 'export -f conda' >> ~/.bashrc
echo 'export -f __conda_activate' >> ~/.bashrc
echo 'export -f __conda_reactivate' >> ~/.bashrc
echo 'export -f __add_sys_prefix_to_path' >> ~/.bashrc
echo 'export -f __conda_hashr' >> ~/.bashrc
echo 'export -f __conda_exe' >> ~/.bashrc
