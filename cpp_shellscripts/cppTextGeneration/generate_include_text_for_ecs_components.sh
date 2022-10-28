#!/bin/zsh
 
###########################################################
# create text for ecs component include
#----------------------------------------------------
# INPUT:
# 
###########################################################
 
 
 
# get input array and count of input array
argv=($@);
argc=${#argv};

echo $argv;
echo $argc;
touch tempfile.txt; local put() {echo $1 >> tempfile.txt}
integer i=1;
while ((i < argc))
do
  put "#include \"ecs/components/${argv[$i+1]}_component.cpp\""
  i+=1
done;
 
pbcopy < tempfile.txt;
rm tempfile.txt;
 
