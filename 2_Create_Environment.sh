#!/bin/bash
#

#Install gdrive e 7z
wget https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_386.tar.gz
tar -xzf gdrive_2.1.1_linux_386.tar.gz
rm gdrive_2.1.1_linux_386.tar.gz
sudo -S apt update
sudo apt -y install p7zip-full

CONDA_BASE=$(conda info --base)

# Create Environment
conda create -y -n deepfacelab -c main python=3.7 cudnn=8.2.1 cudatoolkit=11.3.1
. $CONDA_BASE/etc/profile.d/conda.sh
conda info --envs
conda activate deepfacelab
conda info --envs #check if env is activated
git clone --depth 1 https://github.com/iperov/DeepFaceLab.git
python -m pip install --no-input -r ./DeepFaceLab/requirements-cuda.txt

# Fix Permissions and libraries
chmod +x scripts/*
ln -s libcusolver.so.11.1.2.109 $CONDA_PREFIX_1/envs/deepfacelab/lib/libcusolver.so.10
ln -s libcusolver.so.11.1.2.109 $CONDA_PREFIX_1/pkgs/cudatoolkit-11.3.1-h2bc3f7f_2/lib/libcusolver.so.10

# Clean packagers
sudo apt-get -y clean
conda clean -y -a

# Banner Message
echo
echo "***************************************************************"
echo "* NOW ACTIVATE ENVIRONMENT WITH: 'conda activate deepfacelab' *"
echo "***************************************************************"

