#!/bin/bash
#
DFL_WORKSPACE=$HOME/deepfacelab/workspace

if [ "$#" -gt 0 ]; then
        printf %"s\n" "Usage: 8_merge_SAEHD.sh"
else
	if [ -d "$DFL_WORKSPACE/data_dst" ] && [ -d "$DFL_WORKSPACE/model" ]; then
		if [ "$(ls -A $DFL_WORKSPACE/data_dst)" ] && [ "$(ls -A $DFL_WORKSPACE/model/*SAEHD_*)" ] ; then
			python DeepFaceLab/main.py merge --input-dir "$DFL_WORKSPACE/data_dst" --output-dir "$DFL_WORKSPACE/data_dst/merged" --output-mask-dir "$DFL_WORKSPACE/data_dst/merged_mask" --aligned-dir "$DFL_WORKSPACE/data_dst/aligned" --model-dir "$DFL_WORKSPACE/model" --model SAEHD
		else
			printf %"s\n" "Directory $DFL_WORKSPACE/data_dst is empty or SAEHD model not found."
		fi
	else
		printf %"s\n" "$DFL_WORKSPACE/data_dst or $DFL_WORKSPACE/model do not exist."
	fi
fi