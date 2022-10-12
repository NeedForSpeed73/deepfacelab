#!/bin/bash
MODEL_DIR=$HOME/deepfacelab/workspace/model
MODEL_ID_FILE=$HOME/deepfacelab/model_XSeg.id
WORKSPACE_DIR=$HOME/deepfacelab/workspace
WORKSPACE_ID_FILE=$HOME/deepfacelab/workspace.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 5c_upload_XSeg-model_GDrive.sh"
else 
	if [ -d "$MODEL_DIR" ]; then
		if [ "$(ls -A $MODEL_DIR)" ]; then
			if  [ -f "$MODEL_ID_FILE" ]; then
				$N_FILES=`ls -1q workspace/model/XSeg_* | wc -l`
				zip model_XSeg.zip $MODEL_DIR/XSeg_* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
				MODEL_ID=$(cat $MODEL_ID_FILE)
				printf %"s" "Using id: " $MODEL_ID
				printf %"s\n" " from $MODEL_ID_FILE file"
				./gdrive update $MODEL_ID model_XSeg.zip
				rm model_XSeg.zip
			else
				printf %"s\n" "$MODEL_ID_FILE  doesn't exist."
			fi
		else
			printf %"s\n" "$MODEL_DIR is empty."
		fi
	else
		printf %"s\n" "$MODEL_DIR  does not exist."
	fi
	if [ -d "$WORKSPACE_DIR" ]; then
		if [ "$(ls -A $WORKSPACE_DIR)" ]; then
			if [ -f "$WORKSPACE_ID_FILE" ]; then
				$N_FILES=`ls -1q workspace/data_*/* | wc -l`
				zip -r workspace.zip $WORKSPACE_DIR/data_*/* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
				WORKSPACE_ID=$(cat $WORKSPACE_ID_FILE)
				printf %"s" "Using id: " $WORKSPACE_ID
				printf %"s\n" " from $WORKSPACE_ID_FILE file"
				./gdrive update $WORKSPACE_ID workspace.zip
				rm workspace.zip
			else
				printf %"s\n" "$WORKSPACE_ID_FILE  doesn't exist."
			fi
		else
			printf %"s\n" "$WORKSPACE_DIR is empty."
		fi
	else
		printf %"s\n" "$WORKSPACE_DIR does not exist."
	fi
		printf %"s\n" "Done."
fi  
