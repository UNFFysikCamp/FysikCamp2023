#!/bin/bash
cd /content/FysikCamp2023

folder_path="/content/drive/MyDrive/Colab Notebooks/UNF_Fysik_Camp/source"

if [ ! -d "$folder_path" ]; then
    mkdir -p "$folder_path"
    echo "Folder created: $folder_path"
else
    echo "Folder already exists: $folder_path"
fi



ls | grep -E '.ipynb' | while read -r file; do
  cp "$file" "$folder_path/$new_filename"
done

source_directory="/content/test_colab/"
destination_directory="/content/drive/MyDrive/Colab Notebooks/UNF_Fysik_Camp"

for file in "$source_directory"/*.ipynb; do
  if [ ! -f "$destination_directory/$(basename "$file")" ] && [ "${file##*/}" != "THIS.ipynb" ]; then
    echo "Copying $file to $destination_directory"
    cp "$file" "$destination_directory"
  fi
done

echo "Finished"