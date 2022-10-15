#!/bin/bash
#
DFL_WORKSPACE=$HOME/deepfacelab/workspace

if [ "$#" -gt 0 ]; then
        printf %"s\n" "Usage: 1_extract_image_from_data_src.sh"
else
	if [ -d "$DFL_WORKSPACE" ]; then
		if compgen -G "${DFL_WORKSPACE}/data_src.*" > /dev/null; then
			python DeepFaceLab/main.py videoed extract-video --input-file "$DFL_WORKSPACE/data_src.*" --output-dir "$DFL_WORKSPACE/data_src"
		else
			printf %"s\n" "File data_src not found."
		fi
	else
		printf %"s\n" "$DFL_WORKSPACE does not exist."
	fi
fi
