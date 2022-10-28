#!/bin/zsh
 
###########################################################
# 
#----------------------------------------------------
# INPUT:
# 
###########################################################
 
 
 
# get input array and count of input array
argv=($@);
argc=${#argv};

path="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppTextGeneration/"
 

command_map=(
  "comps_inc" "./generate_include_text_for_ecs_components.sh"
  "comps_reg" "./generate_text_for_ecs_components_registration.sh"
  "sys_reg" "./generate_text_for_ecs_system_registration.sh" 
);

integer i=1;
map_count=${#command_map}+1;
dir=${argv[1]};
found=0;
command_index=2;

while ((i < map_count))
do
  echo ${command_map[$i]}
  if [[ "$dir" == "${command_map[$i]}" ]]
  then
    command_index=$i+1;
    found=1;
    break;
  fi;
  # increment i
  i+=2;
done

script=${command_map[$command_index]};

if [[ "$found" == "1" ]]
then 
  echo "running: ${command_map[$command_index]} ${argv}";
  eval "${path}${script}" $argv;
else
  echo "command not found in the cppcp command map. please try again with a different command."
fi;