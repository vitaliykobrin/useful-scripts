#!/bin/sh

username=$1
password=$2
base_path=$3
target_file_name=$4
unzip_folder=$5

file_name_without_extension=$(echo $target_file_name | awk -F. '{print $1}')
unzip_result_folder=${unzip_folder}/${file_name_without_extension}_$(date '+%H_%M')

mkdir $unzip_result_folder
cd $unzip_result_folder

echo Downloading $base_path/$target_file_name file
wget --user=$username --password=$password $base_path/$target_file_name

echo Unziping archive
unzip $target_file_name

# How to use:
# ./download-from-ftp.sh \
#	username password \
#	ftp://path/to/file file_name.zip \
#	downloading_folder
