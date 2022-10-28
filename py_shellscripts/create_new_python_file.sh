#!/bin/zsh
 
###########################################################
# purpose: creates a python file.
#----------------------------------------------------
# INPUT:
# filename 
###########################################################


# get project name from input 
file_name=$1
tag=$2

# create new_file
full_file_name="${file_name}.py"
touch "${file_name}.py"
echo "#!/usr/bin/env python3" >> "${file_name}.py"

local put() {echo $1 >> $full_file_name}

if [[ "$tag" == "-prob" ]] 
then
  put "from typing import List"
  put ""
  put ""
  put ""
  put "a = 0"
  put "b = 0"
  put "c = 0"
  put "s = Solution()"
  put "print('************')"
  put "print(s.${file_name}(a, b, c))"
  put "print('------------')"
  put ""
fi;

