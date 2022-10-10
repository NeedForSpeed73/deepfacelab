#!/bin/bash
DIR=$HOME/deepfacelab/workspace/model

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 5c_upload_XSeg-model_GDrive.sh"
else 
	if [ -d "$DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			7z u model_XSeg.7z workspace/model/XSeg_*
			MODEL_ID=$(cat model_XSeg.id)
			printf %"s" "Using id: " $MODEL_ID
			printf %"s\n" " from 'model_XSeg.id' file"
			read -p "Do you wanna change ID (S/N)?" -n 1 -r
			if [[ $REPLY =~ ^[Ss]$ ]]; then
				read -p "Enter new ID:" MODEL_ID
			fi
		fi
		./gdrive update $MODEL_ID model_XSeg.7z
		rm model_XSeg.7z
		read -p "Do you want to upload data_src and data_dst to Google Drive (Y/N)?" -n 1 -r
		if [[ $REPLY =~ ^[Ss]$ ]]; then
			7z u workspace.7z workspace/data_*/*
			read -p "Do you wanna change ID (S/N)?" -n 1 -r
			if [[ $REPLY =~ ^[Ss]$ ]]; then
				read -p "Enter new ID:" WORKSPACE_ID
			fi
			./gdrive update $WORKSPACE_ID workspace.7z
		fi
		printf %"s\n" "Done."
	else
		printf %"s\n" "$DIR is empty"
	fi
else
	printf %"s\n" "$DIR  does not exist."
fi  
