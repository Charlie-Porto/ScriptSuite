#!/bin/zsh
 
###########################################################
# 
#----------------------------------------------------
# INPUT:
# library keyword (info function to list)
###########################################################

#imports
func_get_value_by_key="/Users/charlieporto/realshit/shellscripts/core/./get_value_by_key_in_list.sh"
func_get_makefile_path="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppCore/./get_path_of_file_in_project.sh"


# get input array and count of input array
argv=($@);
argc=${#argv};


# establish libraries map
# name, .sh file
library_map=(
  "flite" "./add_flite_to_makefile.sh"  
);
 

# check if seeking info
if [[ "${argv[1]}" == "info" ]]
then
  integer i=1;
  integer len_map=${#library_map};
  while ((i < len_map))
  do
    echo ${library_map[$i]};
    i+=2;
  done;
fi;
 
makefile_path=$(${func_get_makefile_path} compile_project.sh);
script_path=$($func_get_value_by_key ${argv[1]} $library_map);
full_script_path="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppMakeSuite/${script_path}";

eval $full_script_path $makefile_path
