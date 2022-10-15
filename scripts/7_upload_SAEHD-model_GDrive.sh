#!/bin/bash
#
WORKSPACE_DIR=$HOME/deepfacelab/workspace
MODEL_DIR=$HOME/deepfacelab/workspace/model
MODEL_SAEHD_ID_FILE=$MODEL_DIR/model_SAEHD.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 7_update_SAEHD-model_GDrive.sh"
else 
	if [ -d "$MODEL_DIR" ]; then
		if [ "$(ls -A $MODEL_DIR)" ]; then
			if [ -f "$MODEL_SAEHD_ID_FILE" ]; then
				MODEL_SAEHD_ID=$(<$MODEL_SAEHD_ID_FILE)
			else
				read -e -p "Enter <model_SAEHD.zip> Google Drive ID: " MODEL_SAEHD_ID
				printf %"s\n"
			fi
			printf %"s\n" "Creating model_SAEHD.zip"
			N_FILES=`ls -1q workspace/model/*SAEHD_* | wc -l`
			zip model_SAEHD.zip workspace/model/*SAEHD_* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
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
