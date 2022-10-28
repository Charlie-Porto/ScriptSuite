#!/bin/zsh
 
###########################################################
# opens a documenation file based on input key
#----------------------------------------------------
# INPUT:
# string: map key 
###########################################################
 
# import functions
func_get_value_by_key_in_map="/Users/charlieporto/realshit/shellscripts/core/./get_value_by_key_in_list.sh"
func_list_keys_in_map="/Users/charlieporto/realshit/shellscripts/core/./list_keys_in_map.sh"
 
# get input array and count of input array
argv=($@);
argc=${#argv};

selection=${argv[1]}
odoc_file_map=(
  "sh_core" "/Users/charlieporto/realshit/shellscripts/core/documentation/doc.txt"
  "sh_cppCore" "/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppCore/documentation/doc.txt" 
  "sh_cpp" "/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/documentation/doc.txt"
  "sh_pce" "/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppPCE/documentation/doc.txt"
)

if [[ "$selection" == "info" ]]
then
  echo "odoc is a function that opens a specific item of documentation based on the key provided."
  echo "options: -----------------------------"
  $func_list_keys_in_map $odoc_file_map
else 
  file_path=$($func_get_value_by_key_in_map $selection ${odoc_file_map});
  vim $file_path
fi


  


 
 
