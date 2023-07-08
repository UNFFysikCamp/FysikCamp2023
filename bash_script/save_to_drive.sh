#!/bin/bash
cd /content/FysikCamp2023
# This script copies the contents of the FysikCamp2023 folder to the Google Drive folder
# Change the year here
source_folder="/content/FysikCamp2023"

# Folder to exclude from copying
excluded_folders="bash_script" 


excluded_files=(".gitignore" "README.md" "THIS.ipynb")

#Change the year here
destination_folder="/content/drive/MyDrive/Colab Notebooks/UNF_Fysik_Camp2023"
# Copy folders and contents excluding the specified folder and files, without overwriting existing files
rsync -av --exclude="$excluded_folders" --exclude=".git" --exclude-from=<(printf "%s\n" "${excluded_files[@]}") --ignore-existing "$source_folder/" "$destination_folder/"

echo "Finished creating main folder"
excluded_files=(".gitignore" "README.md")
#Change the year here
destination_folder="/content/drive/MyDrive/Colab Notebooks/UNF_Fysik_Camp2023/source"
# Copy folders and contents excluding the specified folder and files
rsync -av --exclude="$excluded_folders" --exclude=".git" --exclude-from=<(printf "%s\n" "${excluded_files[@]/#/--exclude=}") "$source_folder/" "$destination_folder/"

echo "Finished creating source folder"


echo "Finished"
