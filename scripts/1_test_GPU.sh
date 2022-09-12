#!/bin/bash

#python DeepFaceLab/test_GPU.py

function test_GPU {
	python3 - << END
import tensorflow as tf
print('Num GPUs Available: ', len(tf.config.list_physical_devices('GPU')))
END

