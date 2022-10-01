#!/bin/bash
#

if [ "$#" -gt 1 ]; then
        echo "Usage: 6_train_SAEHD.sh [--no-preview]"
else
  if [ "$#" -eq 0 ]; then
         python DeepFaceLab/main.py train --training-data-src-dir workspace/data_src/aligned --training-data-dst-dir workspace/data_dst/aligned --pretraining-data-dir pretrain --model-dir workspace/model --model "SAEHD"
  else if [ $1 != "--no-preview" ]; then
                echo "Usage: 6_train_SAEHD.sh [--no-preview]"
        else
                python DeepFaceLab/main.py train --training-data-src-dir workspace/data_src/aligned --training-data-dst-dir workspace/data_dst/aligned --pretraining-data-dir pretrain --model-dir workspace/model --model "SAEHD" --no-preview
       fi
  fi
fi
