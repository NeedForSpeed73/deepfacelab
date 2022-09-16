#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: 4_download_workspace_GDrive.sh <file_id> from GDrive public link."
else
	./local/bin/gdown $1
	tar -xzf workspace.tar.gz
	rm workspace.tar.gz
fi