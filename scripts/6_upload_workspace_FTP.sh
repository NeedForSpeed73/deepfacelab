#!/bin/bash

DIR=$HOME/deepfacelab/workspace

if [ "$#" -ne 2 ]; then
	echo "Usage: 6_upload_workspace_FTP ftp.youserver.com directory"
else 
	if [ -d "$DIR" ]; then
		if [ "$(ls -A $DIR)" ]; then
			tar -czf workspace.tar.gz workspace/*
			ncftpput -u emilio ftp://$1 $2 workspace.tar.gz
			rm workspace.tar.gz
			echo "Done."
		else
			echo "$DIR is empty"
		fi
	else
		echo "$DIR  does not exist."
	fi  
fi
