#!/bin/zsh
 
###########################################################
# gets the path of a file in a project
#----------------------------------------------------
# INPUT:
# filename
###########################################################

# imports
func_get_project_root="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppCore/./navigate_to_project_root.sh"
func_get_value_by_key="/Users/charlieporto/realshit/shellscripts/core/./get_value_by_key_in_list.sh"
 
 
# get input array and count of input array
argv=($@);
argc=${#argv};

# get project root directory
project_root=$($func_get_project_root $PWD);

# create mapping of filenames to filepaths
path_map=(
  "compile_project.sh" "/make/compile_project.sh"
  "static_variables.cpp" "/src/env_variables/static_variables.cpp"
);
 
path_to_be_appended_to_root=$($func_get_value_by_key ${argv[1]} $path_map);

echo "${project_root}${path_to_be_appended_to_root}";
