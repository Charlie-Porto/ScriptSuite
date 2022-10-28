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


integer len_map=$argc;
integer i=1;
while ((i < len_map))
do
  echo ${argv[$i]};
  i+=2;
done;



 
 
