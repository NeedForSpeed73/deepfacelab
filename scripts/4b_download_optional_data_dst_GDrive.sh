#!/bin/bash
#
DATA_DST_ID_FILE=$HOME/deepfacelab/data_dst.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 4b_download_optional_data_dst_GDrive.sh."
else
	if [ ! -f "$DATA_DST_ID_FILE" ]; then 
		read -e -p "Enter <data_dst.zip> Google Drive ID: " DATA_DST_ID
		touch $DATA_DST_ID_FILE
		echo $DATA_DST_ID > $DATA_DST_ID_FILE
	else
		DATA_DST_ID=$(<$DATA_DST_ID_FILE)
	fi
	 ./gdrive download $DATA_DST_ID
	 N_FILES=`unzip -l data_dst.zip | tail -n 1 | xargs echo -n | cut -d' ' -f2`
	 unzip -o data_dst.zip | tqdm --desc extracted --unit files --unit_scale --total $N_FILES > /dev/null
	 rm data_dst.zip
fi
