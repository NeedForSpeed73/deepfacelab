#!/bin/bash
#
DFL_WORKSPACE=$HOME/deepfacelab/workspace

if [ "$#" -gt 0 ]; then
        printf %"s\n" "Usage: 9_merged_to_mp4.sh"
else
	if [ -d "$DFL_WORKSPACE/data_dst/meged" ]; then
		if [ "$(ls -A $DFL_WORKSPACE/data_dst/merged)" ]; then
			python DeepFaceLab/main.py videoed video-from-sequence --input-dir "$DFL_WORKSPACE/data_dst/merged" --output-file "$DFL_WORKSPACE/result.mp4" --reference-file "$DFL_WORKSPACE/data_dst.*" --include-audio
		else
			printf %"s\n" "Directory $DFL_WORKSPACE/data_dst/merged is empty."
		fi
	else
		printf %"s\n" "$DFL_WORKSPACE/data_dst/merged does not exist."
	fi
fi