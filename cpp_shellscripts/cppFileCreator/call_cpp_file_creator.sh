#!/bin/zsh
 
###########################################################
# calls touchcpp
#----------------------------------------------------
# INPUT:
# filetype (Optional): string (starts with dash)
# filename: string 
###########################################################

# assign input vars to names
file_type="ordinary";
new_file_name=$1;
file_path="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppFileCreator/"

if [[ "$2" ]]; then
  new_file_name=$2;
  file_type=$1;
fi;


touchcpp_function_keyword_map=(
  "ordinary" "./create_ordinary_cppfile.sh"
  "hfile" "./create_ordinary_hfile.sh"
  "ecs_sys" "./create_ecs_system_cppfile.sh"
  "ecs_comp" "./create_ecs_component_cppfile.sh"
  "ftest" "./create_function_testing_cppfile.sh"
  "bmark" "./create_function_benchmarking_cppfile.sh"
  "hcpp" "./create_header_and_implementation_file.sh"
);

command="./create_ordinary_cppfile.sh";
arguments=(
  $new_file_name
);

integer len_keyword_map=${#touchcpp_function_keyword_map}
integer i=1;
while ((i<len_keyword_map))
do
  keyword=${touchcpp_function_keyword_map[$i]};
  if [[ "$file_type" == "$keyword" ]]; then
    command="${touchcpp_function_keyword_map[$i+1]}";
    i=100;
  fi
  i+=2;
done;

if [[ "$command" == "./create_function_testing_cppfile.sh" ]]
then
  arguments+=$3
  arguments+=$4
fi;
if [[ "$command" == "./create_function_benchmarking_cppfile.sh" ]]
then
  arguments+=$3
  arguments+=$4
fi;

eval "${file_path}${command}" $arguments;
