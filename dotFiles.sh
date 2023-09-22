#!/bin/bash

# Variable definitions. Self explanatory.
#project_root=~/git/dotFiles # To hardcode this scripts location
project_root="$(dirname "$0")" # Gets this scripts location
project_home="$project_root/home"
backup_folder="$project_root/backup"
list_file="$project_root/dotFiles.txt"
user_home=~

# Developer toggle, for testing with a test folder rather than the users folder.
#user_home="$project_root/test"
#if [ "$user_home" == "$project_root/test" ]; then mkdir -p "$project_root/test"; fi

# Checks if variables have corresponding files/folders. Nothing important.
##################################################################################
if [ ! -e "$project_home" ];then
   echo "DotFiles home folder $project_home does not exist. Exiting."
   exit 1
fi
if [ ! -e "$backup_folder" ]; then
    echo "DotFiles backup folder $backup_folder does not exist. Exiting."
    exit 1
fi
if [ ! -e "$user_home" ]; then
    echo "User home folder $user_home does not exist. Exiting."
    exit 1
fi
# Check if list of files exists
if [ ! -e "$list_file" ]; then
    echo "The list of dotfiles $list_files does not exist. Exiting."
    exit 1
fi
#################################################################################

# Function to copy files in a specific way
# 
# First it creates a simple backup of destination_file_path (if it exists) to
# /project_root/backup/relative_file_path, overwriting any previous backup.
# Then it copies source_file_path to destination_file_path.
#
# It creates the necessary folders as it goes.
copy() {
    # Function inputs
    local source_file_path="$1"
    local destination_file_path="$2"
    local relative_file_path="$3"

    # Backup file being overwritten
    if [ -e "$destination_file_path" ]; then
        mkdir -p "$backup_folder/$(dirname $relative_file_path)"
        mv "$destination_file_path" "$backup_folder/$relative_file_path"
        echo "Successfully backed up $destination_file_path to $backup_folder/$relative_file_path"
    fi

    # Copy source to destination
    mkdir -p "$(dirname $destination_file_path)"
    cp "$source_file_path" "$destination_file_path"
    echo "Successfully copied $source_file_path to $destination_file_path"
}

# Beginning of script

# Ask the user for the direction of copy
echo
echo "Choose the direction of copy:"
echo "1. From your dotFiles home directory ($project_home) to your home directory ($user_home)"
echo "2. From your home directory ($user_home) to your dotFiles home directory ($project_home)"
read -p "Enter your choice (1/2): " copy_direction
echo
if [[ "$copy_direction" == "1" ]]; then
    # Copy from dotFiles to home
    source_folder="$project_home"
    destination_folder="$user_home"
elif [[ "$copy_direction" == "2" ]]; then
    # Copy from home to dotFiles
    source_folder="$user_home"
    destination_folder="$project_home"
else
    echo "Invalid choice. Please choose 1 or 2."
    exit 1
fi

# Iterate through dotFiles.txt and copy them across in the direction wanted,
# keeping the old file in the backup folder.
while IFS= read -r file; do
    if [[ $file == \#* ]]; then
        continue  # Skip comments
    fi
    if [[ -z "$file" ]]; then
        continue  # Skip empty lines
    fi

    # Use relative location of file to set source and destination location
    source_file="$source_folder/$file"
    destination_file="$destination_folder/$file"

    # Copy source file to destination if source file actually exists.
    if [ -e "$source_file" ]; then
	copy "$source_file" "$destination_file" "$file"
    else
	echo "$source_file does not exist and couldn't be copied, skipped."
    fi
done < "$list_file"

echo
echo "Succeded in copying dotFiles from $source_folder to $destination_folder"
echo
