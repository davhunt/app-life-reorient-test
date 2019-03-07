#!/bin/bash

# make sure dwi is in 'RAS' orientation
dwi=$(jq -r .dwi config.json)
fslhd "$dwi" > dwi_header.txt
[ "`grep -c Right-to-Left dwi_header.txt`" -gt "0" ] && fslswapdim "$dwi" -x y z dwi_fixed.nii.gz
if [ -f dwi_fixed.nii.gz ]; then rm "$dwi" && mv dwi_fixed.nii.gz "$dwi"; fi
