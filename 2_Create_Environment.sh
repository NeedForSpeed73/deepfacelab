#!/bin/bash
#

# Create Environment
conda create -y -n deepfacelab -c main python=3.7 cudnn=8.2.1 cudatoolkit=11.3.1
git clone --depth 1 https://github.com/iperov/DeepFaceLab.git
python -m pip install --no-input -r ./DeepFaceLab/requirements-cuda.txt
conda clean -y -a

# Fix Permissions and libraries
chmod +x scripts/*
ln -s libcusolver.so.11.1.2.109 $CONDA_PREFIX_1/envs/deepfacelab/lib/libcusolver.so.10
ln -s libcusolver.so.11.1.2.109 $CONDA_PREFIX_1/pkgs/cudatoolkit-11.3.1-h2bc3f7f_2/lib/libcusolver.so.10

#Install gdrive e 7z
wget https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_386.tar.gz
tar -xzf gdrive_2.1.1_linux_386.tar.gz
rm gdrive_2.1.1_linux_386.tar.gz
sudo apt update
sudo apt -y install p7zip-full
