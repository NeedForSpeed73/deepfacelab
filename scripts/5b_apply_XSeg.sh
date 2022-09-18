#!/bin/bash

python DeepFaceLab/main.py xseg apply --input-dir workspace/data_src/aligned --model-dir workspace/model
python DeepFaceLab/main.py xseg apply --input-dir workspace/data_dst/aligned --model-dir workspace/model
