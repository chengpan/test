#!/bin/bash 
#生成文件的命令：find . -type f | sed 's:\./::g' > all_files.txt
#文件中的每一行：20151128/1448726185945_file2.png

if [ $# -ne 2 ];then
	echo "give me a file name and an output dir"
	exit
fi

files=`cat $1`
output_dir=$2

for one_file in $files
do
	echo $one_file
	full_file_path=$output_dir/$one_file
	full_dir_path=`dirname $full_file_path`
	if [ ! -d full_dir_path ]; then
		mkdir -p $full_dir_path
	fi
	
	echo wget m.idsuipai.com/file/$one_file -O $full_file_path
	wget m.idsuipai.com/file/$one_file -O $full_file_path
	
done
