#!/bin/bash

DIR=/home/test_user/deepfacelab/workspace

if [ -d "$DIR" ]; then
	if [ "$(ls -A $DIR)" ]; then
	    rm -r $DIR
	    echo "Done."
	else
	    echo "$DIR is empty"
	fi
else
	echo "$DIR  does not exist."
fi
