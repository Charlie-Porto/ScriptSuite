#!/bin/zsh
 
###########################################################
# adds project from package directory to current project. (if in one)
#----------------------------------------------------
# INPUT:
# - name (or abbreviation) of package
#
# prompted INPUT 1:
# - confirm package bring grabbed is correct
#
# prompted INPUT 2:
# - confirm destination folder is correct 
###########################################################

# imports
core_function_find_match='/Users/charlieporto/realshit/shellscripts/core/./find_match_in_list.sh';
packages_location='/Users/charlieporto/realshit/cppstuff/modules';

# assign input variable
target_package_abbreviation=$1;

# get list of packages
package_list=($packages_location/*);
packages=();
len_package_list=${#package_list};

integer i=1;
while ((i < len_package_list+1))
do 
  raw_item=${package_list[$i]};
  item="$(basename ${raw_item})";
  packages+=("${item}");
  # echo $item
  i+=1;
done;

 
# call match function
response=$(${core_function_find_match} ${target_package_abbreviation} ${packages});

# toggle: flip this to 1 if determine that file will be moved
if_execute_package_move="0";

if [[ "$response" == "error: no match found" ]]
then
  echo "no match. please try again";
else
  read -q "REPLY?press Y or N to confirm the package: ${response} ";
  if [[ "$REPLY" == "Y" ]]
  then 
    echo " ";
    echo "confirmed";
    if_execute_package_move="1";
  fi;
  if [[ "$REPLY" == "y" ]]
  then 
    echo " ";
    echo "confirmed";
    if_execute_package_move="1";
  fi;
  if [[ "$if_execute_package_move" == "1" ]]
  then
    integer i=1;
    integer max_loops=6;
    bedrock_directory="/Users/charlieporto/realshit/cppstuff";

    while ((i < max_loops))
    do
      dir="$PWD";
      # check if at last directory (end search -- to add to .config)
      if [[ "$dir" == "$bedrock_directory" ]]
      then
        break;
      fi;

      start_directory=$PWD;
      if [[ "*" ]]
      then
        cd_items=(*);
        integer if_include_folder_present=0;
        
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
          package_source="${packages_location}/${response}";
          package_destination="${PWD}/include/${response}";
          echo "source: ${package_source}";
          echo "destination: ${package_destination}";
          cp -r $package_source $package_destination;
          cd $start_directory;
          echo "package successfully moved to this project's include folder."
          max_loops=10;
        else
          # echo "include folder not found. backing up a directory"
        fi;
      fi;
      i+=1;
      cd ../;
    done;
  fi;
fi;



