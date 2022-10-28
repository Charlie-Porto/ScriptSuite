#!/bin/zsh
 
###########################################################
# purpose: acts as a "hub shellscript", and calls 
# a cpp package manager script based on its input
#----------------------------------------------------
# INPUT:
#   - string: function alias name
#   - string (if function in arg1 has inputs): function input
###########################################################

# assign input variables
function=$1;
function_input="";
if [[ $2 ]]; then function_input=$2; fi;
cppkg_directory="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppPackageManagerFiles/";

# map of function alii to shellscript
cppkg_shellscript_map=(
  "list" "./list_available_packages.sh"
  "l" "./list_available_packages.sh"
  "grab" "./add_cpp_package_to_project.sh"
  "g" "./add_cpp_package_to_project.sh"
);

cppkg_command="";

integer i=1;
integer len_cppkg_script_list=8;
while ((i < len_cppkg_script_list))
do
  if [[ "${function}" == "${cppkg_shellscript_map[$i]}" ]]
  then
    cppkg_command="${cppkg_directory}${cppkg_shellscript_map[$i+1]}";
    break;
    fi;
i+=2;
done;

$cppkg_command $function_input;


