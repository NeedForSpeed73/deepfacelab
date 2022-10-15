#!/bin/bash
#
WORKSPACE_DIR=$HOME/deepfacelab/workspace
MODEL_DIR=$WORKSPACE_DIR/model
WORKSPACE_ID_FILE=$HOME/deepfacelab/workspace.id
MODEL_XSEG_ID_FILE=$HOME/deepfacelab/model_SAEHD.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 5c_upload_XSeg-model_GDrive.sh"
else 
	if [ -d "$MODEL_DIR" ]; then
		if [ "$(ls -A $MODEL_XSEG_DIR)" ]; then
			if [ ! -f "$MODEL_XSEG_ID_FILE" ]; then 
				read -e -p "Enter <model_XSeg.zip> Google Drive ID: " MODEL_XSEG_ID
				touch $MODEL_XSEG_ID_FILE
				echo $MODEL_XSEG_ID > $MODEL_XSEG_ID_FILE
			else
				MODEL_XSEG_ID=$(<$MODEL_XSEG_ID_FILE)
			fi
			printf %"s\n" "Creating model_XSeg.zip"
			N_FILES=`ls -1q workspace/model/XSeg_* | wc -l`
			zip model_XSeg.zip workspace/model/XSeg_* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null				
			printf %"s\n" "Using id: " $MODEL_XSEG_ID				
			./gdrive update $MODEL_XSEG_ID model_XSeg.zip
			rm model_XSeg.zip
		else
			printf %"s\n" "$MODEL_XSEG_DIR is empty."
		fi
	else
		printf %"s\n" "$MODEL_XSEG_DIR does not exist."
	fi
	if [ -d "$WORKSPACE_DIR" ]; then
		if [ "$(ls -A $WORKSPACE_DIR)" ]; then
			if [ ! -f "$WORKSPACE_ID_FILE" ]; then 
				read -e -p "Enter <workspace.zip> Google Drive ID: " WORKSPACE_ID
				touch $WORKSPACE_ID
				echo $WORKSPACE_ID > $WORKSPACE_ID_FILE
			else
				WORKSPACE_ID=$(<$WORKSPACE_ID_FILE)
			fi
			printf %"s\n" "Creating workspace.zip"
			N_FILES=`ls -1q workspace/data_*/* | wc -l`
			zip -r workspace.zip workspace/data_*/* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null			
			printf %"s\n" "Using id: " $WORKSPACE_ID
			./gdrive update $WORKSPACE_ID workspace.zip
			rm workspace.zip
		else
			printf %"s\n" "$WORKSPACE_DIR is empty."
		fi
	else
		printf %"s\n" "$WORKSPACE_DIR does not exist."
	fi
	printf %"s\n" "Done."
fi  
