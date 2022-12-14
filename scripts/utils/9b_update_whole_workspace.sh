#!/bin/bash
#
WORKSPACE_DIR=$HOME/deepfacelab/workspace
WORKSPACE_ID_FILE=$WORKSPACE_DIR/workspace.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 9b_update_whole_workspace.sh"
else 
	if [ -d "$WORKSPACE_DIR" ]; then
		if [ "$(ls -A $WORKSPACE_DIR)" ]; then
			if [ -f "$WORKSPACE_ID_FILE" ]; then
				WORKSPACE_ID=$(<$WORKSPACE_ID_FILE)
			else
				read -e -p "Enter <workspace.zip> Google Drive ID: or "new" for new file: " WORKSPACE_ID
				printf %"s\n"
			fi
			printf %"s\n" "Creating workspace.zip"
			N_FILES=`ls -1q workspace/* | wc -l`
			zip model_SAEHD.zip workspace/* | tqdm --desc added --unit files --unit_scale --total $N_FILES > /dev/null
			if [[ WORKSPACE_ID == "new" ]]; then
				printf %"s\n" "Creating new GDrive file workspace.zip in main directory."
				./gdrive upload workspace.zip
				
			else
				printf %"s\n" "Updating GDrive ID: " $WORKSPACE_ID
				./gdrive update $WORKSPACE_ID workspace.zip
			fi
			printf %"s\n" "Updating GDrive ID: " $WORKSPACE_ID
			./gdrive upload workspace.zip
			rm workspace.zip
			printf %"s\n" "Done."
		else
			printf %"s\n" "$WORKSPACE_DIR is empty"
		fi
	else
		printf %"s\n" "$WORKSPACE_DIR does not exist."
	fi  
fi
