#!/bin/zsh
 
###########################################################
# transports to the project root (if in a project)
#----------------------------------------------------
# INPUT:
# filename
###########################################################
 
 
 
# get input array and count of input array
argv=($@);
argc=${#argv};
 

# set up for searching while loop
original_directory=$PWD;
integer i=1;
integer max_loops=6;
bedrock_directory="~/realshit/cppstuff";
arrived=0;

# navigate to project root directory
while ((i < max_loops))
do
  dir="$PWD";
  # check if at last directory (end search -- to add to .config)
  if [[ "$dir" == "$bedrock_directory" ]]
  then
    break;
  fi;

  if [[ "*" ]]
  then
    cd_items=(*);

    # check if include folder is present (this will mark the project root)
    if_include_folder_present=0;
    integer len_cd_items=${#cd_items};
    integer j=1;
    while ((j < len_cd_items+1))
    do
      if [[ "${cd_items[$j]}" == "include" ]]
      then
        if_include_folder_present=1;
        break;
      fi;
      j+=1
    done;

    if [[ "${if_include_folder_present}" == "1" ]]
    then
      arrived=1;
      break; 
    else
    fi;
  fi;
  i+=1;
  cd ../;
done;

echo $dir
eval cd $dir
 
