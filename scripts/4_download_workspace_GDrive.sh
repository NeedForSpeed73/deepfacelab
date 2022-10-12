#!/bin/bash
#

if [ "$#" -ne 3 ]; then
	printf %"s\n" "Usage: 4_download_workspace_GDrive.sh <workspace.zip file_id> <model_XSeg.zip file_id> <model_SAEHD.zip file_id> from GDrive link."
else
	touch model.id
	printf %"s\n" $1 > workspace.id
	printf %"s\n" $2 > model_XSeg.id
	printf %"s\n" $3 > model_SAEHD.id
	./gdrive download $1
	N_FILES=`unzip -l workspace.zip | tail -n 1 | xargs echo -n | cut -d' ' -f2`
	unzip -o workspace.zip | tqdm --desc extracted --unit files --unit_scale --total $N_FILES > /dev/null
	rm workspace.zip
	./gdrive download $2
	N_FILES=`unzip -l model_XSeg.zip | tail -n 1 | xargs echo -n | cut -d' ' -f2`
	unzip -o model_XSeg.zip | tqdm --desc extracted --unit files --unit_scale --total $N_FILES > /dev/null
	rm model_XSeg.zip
	./gdrive download $3
	N_FILES=`unzip -l model_SAEHD.zip | tail -n 1 | xargs echo -n | cut -d' ' -f2`
	unzip -o model_SAEHD.zip | tqdm --desc extracted --unit files --unit_scale --total $N_FILES > /dev/null
	rm model_SAEHD.zip
fi
