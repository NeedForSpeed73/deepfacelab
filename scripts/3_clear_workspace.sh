#!/bin/bash

DIR=$HOME/deepfacelab/workspace

if [ -d "$DIR" ]; then
	if [ "$(ls -A $DIR)" ]; then
	    rm -r $DIR
	    printf %"s\n" "Done."
	else
	    printf %"s\n" "$DIR is empty"
	fi
else
	printf %"s\n" "$DIR  does not exist."
fi
