#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: 4_download_workspace_GDrive.sh <file_id> from GDrive link."
else
	./gdrive download $1
	7z x workspace.7z
	rm workspace.7z
fi
