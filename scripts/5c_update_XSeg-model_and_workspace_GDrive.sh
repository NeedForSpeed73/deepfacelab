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
				7z u model_XSeg.7z $MODEL_DIR/XSeg_*
				MODEL_ID=$(cat $MODEL_ID_FILE)
				printf %"s" "Using id: " $MODEL_ID
				printf %"s\n" " from $MODEL_ID_FILE file"
				./gdrive update $MODEL_ID model_XSeg.7z
				rm model_XSeg.7z
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
				7z u -r workspace.7z $WORKSPACE_DIR/data_*/
				WORKSPACE_ID=$(cat $WORKSPACE_ID_FILE)
				printf %"s" "Using id: " $WORKSPACE_ID
				printf %"s\n" " from $WORKSPACE_ID_FILE file"
				./gdrive update $WORKSPACE_ID workspace.7z
				rm workspace.7z
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
