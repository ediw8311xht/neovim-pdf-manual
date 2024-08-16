#!/bin/sh

#this is a script to automatically generate pdfs from the html documentation of neovim

download_dir="pages"
output_dir="output"

#make sure the outputdir exist
mkdir -p $output_dir
#proceede to download the pages you want to convert
echo "Downloading stuff"
wget -r --no-parent --no-directories -P $download_dir -o log https://neovim.io/doc/user/
echo "done downloading"
find "${download_dir}" -type f -exec basename -z -s '.html' {} \; \
    | xargs -0 -I '{}' pandoc "${download_dir}/{}.html" -V geometry:a4paper --pdf-engine=pdfroff -o "${output_dir}/{}.pdf"
#while read -r '\0' i ; do
#    echo "--${i}--"
#	#echo "Converting $f.html to $f.pdf"
#	#pandoc $download_dir/$f.html -V geometry:a4paper --pdf-engine=pdfroff -o $output_dir/$f.pdf
#done < <()
