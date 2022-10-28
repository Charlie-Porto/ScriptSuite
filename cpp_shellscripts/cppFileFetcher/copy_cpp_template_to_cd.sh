#!/bin/zsh
 
###########################################################
# copies a file from the cpp template repo to the current directory
#----------------------------------------------------
# INPUT:
# template file keyword
###########################################################

#imports
func_list_keys_in_map="/Users/charlieporto/realshit/shellscripts/core/./list_keys_in_map.sh";
func_get_value_by_key_in_list="/Users/charlieporto/realshit/shellscripts/core/./get_value_by_key_in_list.sh";
 
# get input array and count of input array
argv=($@);
argc=${#argv};

cpp_template_repo_path="/Users/charlieporto/realshit/cppstuff/templates";

template_keyword_map=(
  "readme" "/README_TEMPLATE.md"
  "gitignore" "/gitignore_template/.gitignore"
  "CMakeLists" "/CMakeListsTemplate.txt"
);

if [[ "${argv[1]}" == "info" ]]
then
  eval $func_list_keys_in_map $template_keyword_map;
  exit 0;
fi;

map_value_selected=$($func_get_value_by_key_in_list ${argv[1]} $template_keyword_map);

# check if no value found
if [[ "$map_value_selected" == "NOT_FOUND" ]]
then
  echo "ERROR: no match found for keyword. please try again.";
  exit 1;
fi;


echo $map_value_selected:t;
cp "$cpp_template_repo_path$map_value_selected" "$PWD/$map_value_selected:t";
echo "file ${argv[1]} has been successfully moved to the current directory."

  
 
 
