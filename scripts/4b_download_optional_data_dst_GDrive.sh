#!/bin/bash
#
DATA_DST_ID_FILE=$HOME/deepfacelab/data_dst.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 4b_download_optional_data_dst_GDrive.sh."
else
	if [ ! -f "$DATA_DST_ID_FILE" ]; then 
		read -e -p "Enter <data_dst.zip> Google Drive ID: " DATA_DST_LINK
		DATA_DST_ID="$(echo "$DATA_DST_LINK" | awk -F"/" '{print $6}')"
		touch $DATA_DST_ID_FILE
		echo $DATA_DST_ID > $DATA_DST_ID_FILE
	else
		DATA_DST_ID=$(<$DATA_DST_ID_FILE)
	fi
	FILE_SIZE=$(./gdrive info $DATA_DST_ID | grep Size: | awk -v N=2 '{print $N}')
	NEEDED_SPACE=$(($FILE_SIZE * 3))
	FREE_SPACE=$(df -H . | grep -wE '/' | awk -v N=4 '{print substr($N, 1, length($N)-1)}')
	if [ $FREE_SPACE -gt $NEEDED_SPACE ]; then
	 	./gdrive download $DATA_DST_ID
	 	N_FILES=`unzip -l data_dst.zip | tail -n 1 | xargs echo -n | cut -d' ' -f2`
	 	unzip -o data_dst.zip | tqdm --desc extracted --unit files --unit_scale --total $N_FILES > /dev/null
	 	rm data_dst.zip
	else
		printf %"s\n" "Not enough space on drive for operation."
	fi
fi
