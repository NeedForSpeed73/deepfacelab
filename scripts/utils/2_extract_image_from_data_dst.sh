#!/bin/bash
#
DFL_WORKSPACE=$HOME/deepfacelab/workspace

if [ "$#" -gt 0 ]; then
        printf %"s\n" "Usage: 2_extract_image_from_data_dst.sh"
else
	if [ -d "$DFL_WORKSPACE" ]; then
		if [ -f "$DFL_WORKSPACE/data_src.*" ]; then
			python DeepFaceLab/main.py videoed extract-video --input-file "$DFL_WORKSPACE/data_dst.*" --output-dir "$DFL_WORKSPACE/data_dst" --fps 0
		else
			printf %"s\n" "File data_dst not found."
		fi
	else
		printf %"s\n" "$DFL_WORKSPACE does not exist."
	fi
fi