#!/bin/bash
DIR=$HOME/deepfacelab/workspace/model

if [ "$#" -gt 1 ]; then
	printf %"s\n" "Usage: 7_upload_model_GDrive.sh model.7z [file ID on GDrive]"
else 
	if [ -d "$DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			7z a model.7z workspace/model/*
			if [ "$#" -eq 1 ]; then
				MODEL_ID=$1
				printf %"s" "Using given id: "
				printf %"s\n" $MODEL_ID

			else
				MODEL_ID=$(cat model.id)
				printf %"s" "Using id: " $MODEL_ID
				printf %"s\n" " from 'model.id' file"
			fi
			./gdrive update $MODEL_ID model.7z
			rm model.7z
			printf %"s\n" "Done."
		else
			printf %"s\n" "$DIR is empty"
		fi
	else
		printf %"s\n" "$DIR  does not exist."
	fi  
fi
