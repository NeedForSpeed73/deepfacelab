#!/bin/bash
MODEL_DIR=$HOME/deepfacelab/workspace/model
MODEL_ID_FILE=$HOME/deepfacelab/model_SAEHD.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 7_upload_SAEHD-model_GDrive.sh"
else 
	if [ -d "$MODEL_DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			if [ -f "$MODEL_ID_FILE" ]; then
				$N_FILES=`ls -1q workspace/model/*SAEHD_* | wc -l`
				zip model_SAEHD.zip $MODEL_DIR/*SAEHD_* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
				MODEL_ID=$(cat $MODEL_ID_FILE)
				printf %"s" "Using id: " $MODEL_ID
				printf %"s\n" " from '$MODEL_ID_FILE' file"
				./gdrive update $MODEL_ID model_SAEHD.zip
				rm model_SAEHD.zip
				printf %"s\n" "Done."
			else
				printf %"s\n" "$MODEL_ID_FILE  doesn't exist."
			fi
		else
			printf %"s\n" "$MODEL_DIR is empty"
		fi
	else
		printf %"s\n" "$MODEL_DIR does not exist."
	fi  
fi
