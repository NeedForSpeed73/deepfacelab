#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Usage: 4_download_workspace_GDrive.sh <workspace.7z file_id> <model.7z file_id> from GDrive link."
else
	./gdrive download $1
	7z x workspace.7z
	rm workspace.7z
	./gdrive download $2
	7z x model.7z
	rm model.7z
fi
