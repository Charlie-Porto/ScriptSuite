#!/bin/zsh
 
###########################################################
# shell script that compiles a cpp project based on input
#----------------------------------------------------
# INPUT:
# string: compilation flag (decides which compilation cmd to run)
###########################################################
 
compilation_command_alias=$1;
compilation_command_tag=$2;

# default compilation inputs
compilation_file_folder="src";
compilation_file="main.cpp";
make_file="main.o";
compilation_tags=" -I include ";

if [[ "$compilation_command_alias" ]]
then
  if [[ "$compilation_command_alias" == "sim" ]]
  then
    compilation_file="sim_runner.cpp";
    compilation_tags+=" -L lib -l SDL2-2.0.0 -l SDL2_image-2.0.0";
  fi;
  if [[ "$compilation_command_alias" == "test" ]]
  then
    compilation_file_folder="test"
    compilation_file="test.cpp";
    make_file="test.o";
  fi;
fi;

if [[ "$compilation_command_tag" ]]; then
  if [[ "$compilation_command_tag" == "-sdl" ]]; then
    compilation_tags+=" -L lib -l SDL2-2.0.0 -l SDL2_image-2.0.0";
  fi;
fi;

# run compilation command
command="g++ ${compilation_file_folder}/${compilation_file} -std=c++17 -o ${make_file} ${compilation_tags}";
${(z)command};