#!/bin/bash

DIR=$HOME/deepfacelab/workspace

if [ "$#" -ne 2 ]; then
	echo "Usage: 6_upload_model ftp.youserver.com directory"
else 
	if [ -d "$DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			tar -czf model.tar.gz workspace/model/*
			ncftpput -u emilio ftp://$1 $2 model.tar.gz
			rm model.tar.gz
			echo "Done."
		else
			echo "$DIR is empty"
		fi
	else
		echo "$DIR  does not exist."
	fi  
fi
