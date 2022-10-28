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

h_script_path="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppFileCreator/./create_ordinary_hfile.sh"
cpp_script_path="/Users/charlieporto/realshit/shellscripts/cpp_shellscripts/cppFileCreator/./create_cpp_implementation_file.sh"
 
eval $h_script_path ${argv[1]};
eval $cpp_script_path ${argv[1]};
