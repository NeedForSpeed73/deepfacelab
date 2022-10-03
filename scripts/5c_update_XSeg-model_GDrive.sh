#!/bin/bash
DIR=$HOME/deepfacelab/workspace/model

if [ "$#" -gt 1 ]; then
	printf %"s\n" "Usage: 5c_upload_XSeg-model_GDrive.sh model_XSeg.7z [file ID on GDrive]"
else 
	if [ -d "$DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			7z u model_XSeg.7z workspace/model/XSeg_*
			if [ "$#" -eq 1 ]; then
				MODEL_ID=$1
				printf %"s" "Using given id: "
				printf %"s\n" $MODEL_ID

			else
				MODEL_ID=$(cat model_XSeg.id)
				printf %"s" "Using id: " $MODEL_ID
				printf %"s\n" " from 'model_XSeg.id' file"
			fi
			./gdrive update $MODEL_ID model_XSeg.7z
			rm model_XSeg.7z
			printf %"s\n" "Done."
		else
			printf %"s\n" "$DIR is empty"
		fi
	else
		printf %"s\n" "$DIR  does not exist."
	fi  
fi
