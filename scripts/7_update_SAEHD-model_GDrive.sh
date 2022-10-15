#!/bin/bash
#

MODEL_DIR=$HOME/deepfacelab/workspace/model
MODEL_SAEHD_ID_FILE=$HOME/deepfacelab/model_SAEHD.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 7_upload_SAEHD-model_GDrive.sh"
else 
	if [ -d "$MODEL_DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			if [ ! -f "$MODEL_SAEHD_ID_FILE" ]; then 
				read -e -p "Enter <model_SAEHD.zip> Google Drive ID: " MODEL_SAEHD_ID
				touch $MODEL_SAEHD_ID
				echo $MODEL_SAEHD_ID > $MODEL_SAEHD_ID_FILE
			else
				MODEL_SAEHD_ID=$(<$MODEL_SAEHD_ID_FILE)
			fi
			printf %"s\n" "Creating model_SAEHD.zip"
			N_FILES=`ls -1q workspace/model/*SAEHD_* | wc -l`
			zip model_SAEHD.zip workspace/model/*SAEHD_* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
			printf %"s\n" "Using id: " $MODEL_SAEHD_ID
			./gdrive update $MODEL_SAEHD_ID model_SAEHD.zip
			rm model_SAEHD.zip
			printf %"s\n" "Done."
		else
			printf %"s\n" "$MODEL_DIR is empty"
		fi
	else
		printf %"s\n" "$MODEL_DIR does not exist."
	fi  
fi
