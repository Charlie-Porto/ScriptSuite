#!/bin/zsh
 
###########################################################
# explained_by_title
#----------------------------------------------------
# INPUT:
# 
###########################################################
 
# imports 
coref_get_value_by_list_key="/Users/charlieporto/realshit/shellscripts/core/./get_value_by_key_in_list.sh"
coref_list_map_keys="/Users/charlieporto/realshit/shellscripts/core/./list_keys_in_map.sh" 

# get input array and count of input array
argv=($@);
argc=${#argv};
 
# assign varibles 
file_type=${argv[1]}
file_name=${argv[2]}

file_map=(
  "comp" "/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppPCE/./open_component_file.sh"
  "sys" "/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppPCE/./open_system_file.sh"
)

if [[ "$file_type" == "info" ]]
then
  $coref_list_map_keys $file_map
else 
  script=$($coref_get_value_by_list_key $file_type $file_map)
  $script $file_name
fi
  


 
