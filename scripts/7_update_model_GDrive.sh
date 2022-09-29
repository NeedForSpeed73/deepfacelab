#!/bin/bash
DIR=$HOME/deepfacelab/workspace/model

if [ "$#" -ne 1 ]; then
	echo "Usage: 7_upload_model_GDrive.sh model.7z file ID on GDrive"
else 
	if [ -d "$DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			7z a model.7z workspace/model/*
			./gdrive update $1 model.7z
			rm model.7z
			echo "Done."
		else
			echo "$DIR is empty"
		fi
	else
		echo "$DIR  does not exist."
	fi  
fi
