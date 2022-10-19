#!/bin/bash
#
WORKSPACE_ID_FILE=$HOME/deepfacelab/workspace.id
MODEL_XSEG_ID_FILE=$HOME/deepfacelab/model_XSeg.id
MODEL_SAEHD_ID_FILE=$HOME/deepfacelab/model_SAEHD.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 4_download_workspace_GDrive.sh."
else
	if [ ! -f "$WORKSPACE_ID_FILE" ]; then 
		read -e -p "Enter <workspace.zip> Google Drive Link: " WORKSPACE_LINK
		WORKSPACE_ID="$(echo "$WORKSPACE_LINK" | awk -F"/" '{print $6}')"
		touch $WORKSPACE_ID_FILE
		echo $WORKSPACE_ID > $WORKSPACE_ID_FILE
		printf %"s\n"
	else
		WORKSPACE_ID=$(<$WORKSPACE_ID_FILE)
	fi
	if [ ! -f "$MODEL_XSEG_ID_FILE" ]; then 
		read -e -p "Enter <model_XSeg.zip> Google Drive Link: " MODEL_XSEG_LINK
		MODEL_XSEG_ID="$(echo "$MODEL_XSEG_LINK" | awk -F"/" '{print $6}')"
		touch $MODEL_XSEG_ID_FILE
		echo $MODEL_XSEG_ID > $MODEL_XSEG_ID_FILE
		printf %"s\n"
	else
		MODEL_XSEG_ID=$(<$MODEL_XSEG_ID_FILE)
	fi
	if [ ! -f "$MODEL_SAEHD_ID_FILE" ]; then 
		read -e -p "Enter <model_SAEHD.zip> Google Drive Link: " MODEL_SAEHD_LINK
		MODEL_SAEHD_ID="$(echo "$MODEL_SAEHD_LINK" | awk -F"/" '{print $6}')"
		touch $MODEL_SAEHD_ID_FILE
		echo $MODEL_SAEHD_ID > $MODEL_SAEHD_ID_FILE
		printf %"s\n"
	else
		MODEL_SAEHD_ID=$(<$MODEL_SAEHD_ID_FILE)
	fi
	gdown --id $WORKSPACE_ID
	N_FILES=`unzip -l workspace.zip | tail -n 1 | xargs echo -n | cut -d' ' -f2`
	unzip -o workspace.zip | tqdm --desc extracted --unit files --unit_scale --total $N_FILES > /dev/null
	rm workspace.zip
	gdown --id $MODEL_XSEG_ID
	N_FILES=`unzip -l model_XSeg.zip | tail -n 1 | xargs echo -n | cut -d' ' -f2`
	unzip -o model_XSeg.zip | tqdm --desc extracted --unit files --unit_scale --total $N_FILES > /dev/null
	rm model_XSeg.zip
	gdown --id $MODEL_SAEHD_ID
	N_FILES=`unzip -l model_SAEHD.zip | tail -n 1 | xargs echo -n | cut -d' ' -f2`
	unzip -o model_SAEHD.zip | tqdm --desc extracted --unit files --unit_scale --total $N_FILES > /dev/null
	rm model_SAEHD.zip
fi
