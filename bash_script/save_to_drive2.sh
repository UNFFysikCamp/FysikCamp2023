#!/bin/bash

source_folder="/content/FysikCamp2023"

excluded_folder=("bash_script" ".git")


excluded_files=(".gitignore" "README.md" "THIS.ipynb")
destination_folder="/content/drive/MyDrive/Colab Notebooks/UNF_Fysik_Camp2023"
# Copy folders and contents excluding the specified folder and files, without overwriting existing files
rsync -av --exclude="$excluded_folder" --exclude-from=<(printf "%s\n" "${excluded_files[@]}") --ignore-existing "$source_folder/" "$destination_folder/"

echo "Finished creating main folder"
excluded_files=(".gitignore" "README.md")
destination_folder="/content/drive/MyDrive/Colab Notebooks/UNF_Fysik_Camp2023/source"
# Copy folders and contents excluding the specified folder and files
rsync -av --exclude="$excluded_folder" --exclude-from=<(printf "%s\n" "${excluded_files[@]}") "$source_folder/" "$destination_folder/"

echo "Finished creating source folder"


echo "Finished"
