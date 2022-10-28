#!/bin/zsh
 
###########################################################
# explained_by_title
#----------------------------------------------------
# INPUT:
# 
###########################################################
 
# imports 
coref_coda="/Users/charlieporto/realshit/shellscripts/core/./open_abbreviated_file_in_vscode.sh"
cpp_coref_get_project_root="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppCore/./navigate_to_project_root.sh"
 
# get input array and count of input array
argv=($@);
argc=${#argv};
 
# assign varibles 
component_name=${argv[1]}

dir="$PWD"
project_root=$($cpp_coref_get_project_root)
cd ${project_root}/components
eval $coref_coda $component_name
cd $dir





 
