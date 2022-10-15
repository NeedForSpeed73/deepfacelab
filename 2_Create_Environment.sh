#!/bin/bash
#

#Install gdrive e zip
printf %"s\n" "" "* Installing gdrive (https://github.com/prasmussen/gdrive)" ""
wget https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_386.tar.gz
tar -xzf gdrive_2.1.1_linux_386.tar.gz
rm gdrive_2.1.1_linux_386.tar.gz

printf %"s\n" "" "* Installing zip (package zip and unzip)" ""
sudo -S apt update
sudo apt -y install zip unzip

#Install Nvidia Proprietary Drivers if asked
read -p "Do you want to install Nvidia Proprietary Drivers? (Y/N)" -n 1 -r
printf %"s\n" "" "* Installing Nvidia Proprietary Drivers" ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
	read -e -p "Enter Drivers File Google Drive ID: " DRIVERS_ID
	./gdrive download $DRIVERS_ID
	DRIVERS_FILENAME=`ls NVIDIA-Linux*`
	sudo sh ./$DRIVERS_FILENAME
	rm $DRIVERS_FILENAME
fi

CONDA_BASE=$(conda info --base)

# Create Environment
printf %"s\n" "" "* Creating Environment deepfacelab with python=3.7 cudnn=8.2.1 cudatoolkit=11.3.1" ""
conda create -y -n deepfacelab -c main python=3.7 cudnn=8.2.1 cudatoolkit=11.3.1
. $CONDA_BASE/etc/profile.d/conda.sh
conda info --envs
conda activate deepfacelab
conda info --envs #check if env is activated

printf %"s\n" "" "* Downloading DeepFaceLab (https://github.com/iperov/DeepFaceLab.git) and installing requirements-cuda" ""
git clone --depth 1 https://github.com/iperov/DeepFaceLab.git
python -m pip install --no-input -r ./DeepFaceLab/requirements-cuda.txt

# Fix Permissions and libraries
printf %"s\n" "" "* Making scripts executable and fixing libraries permissions" ""
chmod -R +x scripts/*
ln -s libcusolver.so.11.1.2.109 $CONDA_PREFIX_1/envs/deepfacelab/lib/libcusolver.so.10
ln -s libcusolver.so.11.1.2.109 $CONDA_PREFIX_1/pkgs/cudatoolkit-11.3.1-h2bc3f7f_2/lib/libcusolver.so.10

# Clean packagers
printf %"s\n" "" "* Cleaning Up" ""
sudo apt-get -y clean
conda clean -y -a

# Banner Message
printf %"s\n" "" "***************************************************************"
printf %"s\n" "* NOW ACTIVATE ENVIRONMENT WITH: 'conda activate deepfacelab' *"
printf %"s\n" "***************************************************************" ""

