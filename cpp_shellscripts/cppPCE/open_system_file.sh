#!/bin/zsh
 
###########################################################
# explained_by_title
#----------------------------------------------------
# INPUT:
# string: file name
###########################################################
 
# imports 
coref_coda="/Users/charlieporto/realshit/shellscripts/core/./open_abbreviated_file_in_vscode.sh"
cpp_coref_get_project_root="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppCore/./navigate_to_project_root.sh"
 
# get input array and count of input array
argv=($@);
argc=${#argv};
 
# assign varibles 
file_name=${argv[1]}

# get project root, then go to compnent folder
original_dir="$PWD"
project_root=$($cpp_coref_get_project_root)
cd ${project_root}/pce3d/systems
$coref_coda $file_name
cd $original_dir