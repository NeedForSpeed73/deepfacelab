#!/bin/bash
#

if [ "$#" -gt 1 ]; then
        echo "Usage: 5_train_XSeg.sh [--no-preview]"
else
	if [ "$#" -eq 0 ]; then
		python DeepFaceLab/main.py train --training-data-src-dir workspace/data_src/aligned --training-data-dst-dir workspace/data_dst/aligned --model-dir workspace/model --model "XSeg"
	else if [ $1 != "--no-preview" ]; then
			echo "Usage: 5_train_XSeg.sh [--no-preview]"
		else
			python DeepFaceLab/main.py train --training-data-src-dir workspace/data_src/aligned --training-data-dst-dir workspace/data_dst/aligned --model-dir workspace/model --model "XSeg" --no-preview
		fi
	fi
fi