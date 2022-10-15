#!/bin/bash
#

MODEL_DIR=$HOME/deepfacelab/workspace/model

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 7_upload_SAEHD-model_GDrive.sh"
else 
	if [ -d "$MODEL_DIR" ]; then
		if [ "$(ls -A $MODEL_DIR)" ]; then
			printf %"s\n" "Creating model_SAEHD.zip"
			N_FILES=`ls -1q workspace/model/*SAEHD_* | wc -l`
			zip model_SAEHD.zip workspace/model/*SAEHD_* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
			./gdrive upload $MODEL_SAEHD_ID model_SAEHD.zip
			rm model_SAEHD.zip
			printf %"s\n" "Done."
		else
			printf %"s\n" "$MODEL_DIR is empty"
		fi
	else
		printf %"s\n" "$MODEL_DIR does not exist."
	fi  
fi
