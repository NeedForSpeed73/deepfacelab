#!/bin/bash
DIR=$HOME/deepfacelab/workspace/model

if [ "$#" -gt 1 ]; then
	printf %"s\n" "Usage: 7_upload_SAEHD-model_GDrive.sh model_SAEHD.7z [file ID on GDrive]"
else 
	if [ -d "$DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			7z a model_SAEHD.7z workspace/model/*SAEHD_*
			if [ "$#" -eq 1 ]; then
				MODEL_ID=$1
				printf %"s" "Using given id: "
				printf %"s\n" $MODEL_ID

			else
				MODEL_ID=$(cat model_SAEHD.id)
				printf %"s" "Using id: " $MODEL_ID
				printf %"s\n" " from 'model_SAEHD.id' file"
			fi
			./gdrive update $MODEL_ID model_SAEHD.7z
			rm model_SAEHD.7z
			printf %"s\n" "Done."
		else
			printf %"s\n" "$DIR is empty"
		fi
	else
		printf %"s\n" "$DIR  does not exist."
	fi  
fi
