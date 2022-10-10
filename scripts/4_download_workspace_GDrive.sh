#!/bin/bash

if [ "$#" -ne 3 ]; then
	printf %"s\n" "Usage: 4_download_workspace_GDrive.sh <workspace.7z file_id> <model_XSeg.7z file_id> <model_SAEHD.7z file_id> from GDrive link."
else
	touch model.id
	printf %"s\n" $1 >> workspace.id
	printf %"s\n" $2 >> model_XSeg.id
	printf %"s\n" $3 >> model_SAEHD.id
	./gdrive download $1
	7z x workspace.7z
	rm workspace.7z
	./gdrive download $2
	7z x model_XSeg.7z
	rm model_XSeg.7z
	./gdrive download $3
	7z x model_SAEHD.7z
	rm model_SAEHD.7z
fi
