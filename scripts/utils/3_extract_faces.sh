#!/bin/bash
#
DFL_WORKSPACE=$HOME/deepfacelab/workspace

if [ "$#" -gt 0 ]; then
        printf %"s\n" "Usage: 3_extract_faces.sh"
else
	if [ -d "$DFL_WORKSPACE/data_src" ]; then
		if [ "$(ls -A $DFL_WORKSPACE/data_src)" ]; then
			python DeepFaceLab/main.py extract --input-dir "$DFL_WORKSPACE/data_src" --output-dir "$DFL_WORKSPACE/data_src/aligned" --detector s3fd
		else
			printf %"s\n" "Directory $DFL_WORKSPACE/data_src is empty."
		fi
	else
		printf %"s\n" "$DFL_WORKSPACE/data_src does not exist."
	fi
	if [ -d "$DFL_WORKSPACE/data_dst" ]; then
		if [ "$(ls -A $DFL_WORKSPACE/data_dst)" ]; then
			python DeepFaceLab/main.py extract --input-dir "$DFL_WORKSPACE/data_dst" --output-dir "$DFL_WORKSPACE/data_dst/aligned" --detector s3fd --max-faces-from-image 0 --output-debug
		else
			printf %"s\n" "Directory $DFL_WORKSPACE/data_dst is empty."
		fi
	else
		printf %"s\n" "$DFL_WORKSPACE/data_dst does not exist."
	fi
fi