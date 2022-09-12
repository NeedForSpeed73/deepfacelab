#!/bin/bash

python DeepFaceLab/main.py train --training-data-src-dir workspace/data_src/aligned --training-data-dst-dir workspace/data_dst/aligned --pretraining-data-dir pretrain --model-dir workspace/model --model "SAEHD" --no-preview
