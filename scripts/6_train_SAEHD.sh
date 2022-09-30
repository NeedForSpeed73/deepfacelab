#!/bin/bash
#

if [ "$#" -ne 0 ] | [ "$#" -ne 1 ]; then
        echo "Usage: 6_train_SAEHD.sh [--no-preview]"
else
  if [ $1 != "--no-preview" ]; then
    echo "Usage: 6_train_SAEHD.sh [--no-preview]"
  else
    python DeepFaceLab/main.py train --training-data-src-dir workspace/data_src/aligned --training-data-dst-dir workspace/d>  fi
fi
