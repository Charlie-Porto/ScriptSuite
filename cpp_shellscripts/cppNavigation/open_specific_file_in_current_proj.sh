#!/bin/zsh
 
###########################################################
# opens a specific file in the current project
#----------------------------------------------------
# INPUT:
# filename (an enum) 
###########################################################

# imports
core_function_find_match='/Users/charlieporto/realshit/shellscripts/core/./find_match_in_list.sh';
core_function_print_list='/Users/charlieporto/realshit/shellscripts/core/./list_keys_in_map.sh';

# get input array and count of input array
argv=("$@");
argc=${#input_array};





# loop through directories until find project root directory
project_root=""
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
      j+=1;
    done;

    if [[ "${if_include_folder_present}" == "1" ]]
    then
      project_root="$PWD";
      i+=10;
    fi;
  fi;
  i+=1;
  cd ../
done;

# echo $project_root

command_map=(
  "main" "src/main.cpp"
  "makef" "make/compile_project.sh"
)

start_dir=${argv[1]}

if [[ "$start_dir" == "info" ]]
then 
  $core_function_print_list $command_map
else  

  echo $start_dir
  integer map_count=${#command_map};
  integer i=1;
  integer command_index=2;
  found=0;

  while ((i<map_count))
  do
    # check if match
    if [[ "$start_dir" == "${command_map[$i]}" ]]
    then
      command_index=$i+1;
      found=1;
      break;
    fi
    # increment i
    i+=2;
  done;

  file_path="${project_root}/${command_map[$command_index]}"
  if [[ "$found" == "1" ]]
  then 
    echo "opening: $file_path"
    code ${file_path};
  else
    echo "command not found in the codas command map. please try again with a different command."
  fi;
fi;


 
