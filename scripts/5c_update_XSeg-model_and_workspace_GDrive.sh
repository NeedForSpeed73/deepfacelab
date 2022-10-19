#!/bin/bash
#
WORKSPACE_DIR=$HOME/deepfacelab/workspace
MODEL_DIR=$WORKSPACE_DIR/model
WORKSPACE_ID_FILE=$WORKSPACE_DIR/workspace.id
MODEL_XSEG_ID_FILE=$MODEL_DIR/model_XSeg.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 5c_upload_XSeg-model_GDrive.sh"
else 
	if [ -d "$WORKSPACE_DIR" ]; then
		if [ "$(ls -A $WORKSPACE_DIR)" ]; then
			if [ -f "$WORKSPACE_ID_FILE" ]; then
				WORKSPACE_ID=$(<$WORKSPACE_ID_FILE)
			else
				read -e -p "Enter <workspace.zip> Google Drive Link or "new" for new file: " WORKSPACE_LINK
				if [[ WORKSPACE_LINK != "new" ]]; then
					WORKSPACE_ID="$(echo "$WORKSPACE_LINK" | awk -F"/" '{print $6}')"
				fi
				printf %"s\n"
			fi
			printf %"s\n" "Creating workspace.zip"
			N_FILES=`ls -1q workspace/data_*/* | wc -l`
			zip -r workspace.zip workspace/data_*/* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
			if [[ WORKSPACE_ID_LINK == "new" ]]; then
				printf %"s\n" "Creating new GDrive file workspace.zip in main directory."
				./gdrive upload workspace.zip
				
			else
				printf %"s\n" "Updating GDrive ID: " $WORKSPACE_ID
				./gdrive update $WORKSPACE_ID workspace.zip
			fi
			rm workspace.zip
		else
			printf %"s\n" "$WORKSPACE_DIR is empty."
		fi
	else
		printf %"s\n" "$WORKSPACE_DIR does not exist."
	fi
	if [ -d "$MODEL_DIR" ]; then
		if [ "$(ls -A $MODEL_XSEG_DIR)" ]; then
			if [ -f "MODEL_XSEG_ID_FILE" ]; then
				MODEL_XSEG_ID=$(<$MODEL_XSEG_ID_FILE)
			else
				read -e -p "Enter <model_XSeg.zip> Google Drive Link or "new" for new file: " MODEL_XSEG_LINK
				if [[ MODEL_XSEG_LINK != "new" ]]; then
					MODEL_XSEG_ID="$(echo "$MODEL_XSEG_LINK" | awk -F"/" '{print $6}')"
				printf %"s\n"
			fi
			printf %"s\n" "Creating model_XSeg.zip"
			N_FILES=`ls -1q workspace/model/XSeg_* | wc -l`
			zip model_XSeg.zip workspace/model/XSeg_* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
			if [[ MODEL_XSEG_LINK == "new" ]]; then
				printf %"s\n" "Creating new GDrive file model_XSeg.zip in main directory."
				./gdrive upload model_XSeg.zip
				
			else
				printf %"s\n" "Updating GDrive ID: " $MODEL_XSEG_ID
				./gdrive update $MODEL_XSEG_ID model_XSeg.zip
			fi
			rm model_XSeg.zip
			printf %"s\n" "Done."
		else
			printf %"s\n" "$MODEL_XSEG_DIR is empty."
		fi
	else
		printf %"s\n" "$MODEL_XSEG_DIR does not exist."
	fi
fi  
