#!bin/bash

while true
do

	month=$(date +%b)
	iostat_output="iostat_log_${month}"
	dstat_output="dstat_log_${month}"
	
	date '+%B %d, %Y %H:%M:%S' >> iostat_output
	date '+%B %d, %Y %H:%M:%S' >> dstat_output
	iostat -xy 1 1 | awk '/Device/ || /sda/ || /sdb/ {print}' >> $iostat_output
	dstat -cdngy -D sda,sdb 1 2 | awk 'NR!=3 {print}' >> $dstat_output
	#sleep 1
	
done